import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pucextrato/app/modules/contas/model/contas.model.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';

class ContasService {
  ConfigController config = ConfigController();
  CoordenadorController coordenadorController =
      Get.put(CoordenadorController());

  Dio dio = Dio();
  Future<RxList<ContasModel>> getContas() async {
    RxList<ContasModel> result = RxList<ContasModel>.empty();
    var response = await dio.get(
        '${config.urlPadrao}/Contas?coordenador=${coordenadorController.coordenador.coordenador}&listarmaes=true');
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.data[0])['tabContas'];
      ContasModel c = const ContasModel();
      for (var element in data) {
        c = ContasModel(
          conta: element['conta'],
          contaMae: element['contaMae'],
          descricao: element['descricao'],
          descricaoBase: element['descricaoBase'],
        );
        result.add(c);
      }
    }
    return result;
  }

  Future<ContasModel> getConta() async {
    var result = const ContasModel();
    return result;
  }
}
