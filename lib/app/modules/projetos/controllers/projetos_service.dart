import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';
import 'package:pucextrato/app/modules/projetos/model/projeto_model.dart';

class ProjetosService extends GetxController {
  ProjetosController projetosController = Get.put(ProjetosController());

  List<DropDownValueModel> dropDownList(List<ProjetoModel> lista) {
    List<DropDownValueModel> retorno = [];
    for (var element in lista) {
      DropDownValueModel d = DropDownValueModel(
          name: element.projeto.toString(), value: element.codigo);
      retorno.add(d);
    }
    return retorno;
  }

  Future<List<ProjetoModel>> listaProjetosCoordenador() async {
    Dio dio = Dio();
    List<ProjetoModel> lista = [];

    CoordenadorController coordenadorController =
        Get.put(CoordenadorController());
    ConfigController config = ConfigController();
    var response = await dio.get(
        "${config.urlPadrao}/projetos?coordenador=${coordenadorController.coordenador.coordenador}");
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.data[0])['tabProjetos'];
      ProjetoModel p = const ProjetoModel();

      for (var element in data) {
        p = ProjetoModel(
            codigo: element['codigo'],
            projeto: element['projeto'].toString().trim(),
            descricao: element['descricao'],
            coordenador: element['coordenador'],
            contaPrincipal: element['conta_principal'],
            tipoProjeto: element['tipo_projeto']);
        lista.add(p);
        // projetosController.listaProjetosCoordenador();
        // print(p);
      }
    }
    return lista;
  }
}
