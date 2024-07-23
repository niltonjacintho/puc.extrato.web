import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/contas/controllers/contas_controller.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/saldoProjetos/controllers/saldo_projetos_controller.dart';
import 'package:pucextrato/app/modules/saldoProjetos/model/saldo_projeto_model.dart';

class SaldoProjetosService {
  Dio dio = Dio();

  ConfigController configController = Get.put(ConfigController());
  CoordenadorController coordenadorController =
      Get.put(CoordenadorController());
  ContasController contasController = Get.put(ContasController());
  static SaldoProjetosController saldoProjetosController =
      Get.put(SaldoProjetosController());

  Future<RxList<PlutoRow>> getRows(List<SaldoProjetoModel> lista) async {
    RxList<PlutoRow> rows = RxList<PlutoRow>([]);
    print('Linhas em lista ${lista.length}');
    for (var element in lista) {
      final PlutoRow r = PlutoRow(
        cells: {
          'nomeProjeto': PlutoCell(value: element.nomeProjeto),
          'saldo': PlutoCell(value: element.saldo),
        },
      );
      rows.add(r);
    }
    return rows;
  }

  getExtrato() async {
    saldoProjetosController.rows.clear();
    var response = await dio.get(
        '${configController.urlPadrao}extratos/GetAnaliseContas/coordenador/${coordenadorController.idCoordenador}/conta/${contasController.contaAtual.value}/data/${configController.fimPeriodo.value.toIso8601String().substring(0, 10)}');
    List<dynamic> data = jsonDecode(response.data[0])['tabAnaliseContas'];
    for (var element in data) {
      final PlutoRow r = PlutoRow(
        cells: {
          'nomeProjeto': PlutoCell(value: element['nomeProjeto']),
          'saldo': PlutoCell(value: element['saldo']),
        },
      );
      saldoProjetosController.rows.add(r);
    }
    saldoProjetosController.refresh();
  }
}
