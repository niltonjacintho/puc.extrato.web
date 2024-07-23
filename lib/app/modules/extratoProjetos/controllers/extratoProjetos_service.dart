import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/extratoProjetos/controllers/extrato_projetos_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';

class ExtratoProjetosService {
  Dio dio = Dio();
  ProjetosController projetos = Get.put(ProjetosController());
  CoordenadorController coordenador = Get.put(CoordenadorController());
  ConfigController config = Get.put(ConfigController());
  static ExtratoProjetosController extrato =
      Get.put(ExtratoProjetosController());

  getExtratoProjetosService() async {
    final lista = [];
    final response = await dio.get(
        '${config.urlPadrao}/extratos/getExtrato/projeto/${projetos.idProjeto}/di/${config.inicioPeriodo.value.toIso8601String().substring(0, 10)}/df/${config.fimPeriodo.value.toIso8601String().substring(0, 10)}/pagina/1/pagina_tamanho/9999');
    print(
        '${config.urlPadrao}/extratos/getExtrato/projeto/${projetos.idProjeto}/di/${config.inicioPeriodo.value.toIso8601String().substring(0, 10)}/df/${config.fimPeriodo.value.toIso8601String().substring(0, 10)}/pagina/1/pagina_tamanho/9999');
    print(response);
    List<dynamic>? data = jsonDecode(response.data[0])['tabExtrato'];
    extrato.rows.clear();
    if (data != null) {
      for (var element in data) {
        print(element);
        String dateTime = '';
        try {
          String dateString = element['data'];

          String dayString = dateString.substring(8, 10);
          String monthString = dateString.substring(5, 7);
          String yearString = dateString.substring(0, 4);

          int day = int.parse(dayString);
          int month = int.parse(monthString);
          int year = int.parse(yearString);

          dateTime = '$day/$month/$year';
          // DateTime(year, month, day);
        } catch (e) {
          print('ERRO $e');
        }

        final PlutoRow r = PlutoRow(
          cells: {
            'data': PlutoCell(
              value: dateTime, // element['data'],
            ),
            'fatura': PlutoCell(value: element['fatura']),
            'texto': PlutoCell(value: element['texto']),
            'receita': PlutoCell(value: element['receita']),
            'despesa': PlutoCell(value: element['despesa']),
            'saldo': PlutoCell(value: element['saldo']),
          },
        );

        extrato.rows.add(r);
      }
    }
    extrato.refresh();
  }
}
