import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';

class SaldoContasService {
  Dio dio = Dio();

  ConfigController configController = Get.put(ConfigController());
  CoordenadorController coordenadorController =
      Get.put(CoordenadorController());
  Future<RxList<PlutoRow>> getExtrato() async {
    var response = await dio.get(
        '${configController.urlPadrao}extratos/GetSaldosContas/coordenador/${coordenadorController.idCoordenador}/data/${configController.fimPeriodo.value.toIso8601String().substring(0, 10)}');
    List<dynamic> data = jsonDecode(response.data[0])['tabSaldoContas'];
    final RxList<PlutoRow> rows = RxList<PlutoRow>([]);
    for (var element in data) {
      final PlutoRow r = PlutoRow(
        cells: {
          'conta':
              PlutoCell(value: "${element['conta']} - ${element['descricao']}"),
          'saldo': PlutoCell(value: element['saldo']),
        },
      );
      rows.add(r);
    }
    return rows;
  }
}
