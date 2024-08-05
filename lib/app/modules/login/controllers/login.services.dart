import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pucextrato/app/modules/contas/controllers/contas_controller.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/login/controllers/login_controller.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';
import 'package:pucextrato/app/modules/saldoContas/controllers/saldo_contas_controller.dart';

import '../../general/config.dart';

class LoginServices {
  Dio dio = Dio();
  CoordenadorController coordenadorController =
      Get.put(CoordenadorController());

  ContasController contas = Get.put(ContasController());
  SaldoContasController saldoContasController =
      Get.put(SaldoContasController());

  static LoginController loginControler = Get.put(LoginController());
  ConfigController config = ConfigController();
  ProjetosController projetos = Get.put(ProjetosController());

  Future<int> login() async {
    // loginControler.usuario.value = '2154';
    // loginControler.senha.value = '365698';
    try {
      //dio.
      var response = await dio.get(
          '${config.urlPadrao}usuarios?_usuario=${loginControler.usuario.value}&_senha=${loginControler.senha.value}');

      coordenadorController.coordenador.nome =
          jsonDecode(response.data[0])['tabUsuario'][0]["nome"];
      coordenadorController.coordenador.email =
          jsonDecode(response.data[0])['tabUsuario'][0]["email"];
      coordenadorController.coordenador.coordenador =
          jsonDecode(response.data[0])['tabUsuario'][0]["coordenador"];
      coordenadorController.refresh();
      if (response.statusCode == 200) {
        projetos.listaProjetosCoordenador();
        contas.getContas();
        projetos.refresh();
        coordenadorController.idCoordenador.value =
            int.parse(loginControler.usuario.value);
        saldoContasController.getExtratoContas();
        // Get.to(() => const HomeView());
      }
      return response.statusCode!;
    } catch (e) {
      return 401;
    }
  }
}
