import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/extratoProjetos/controllers/extrato_projetos_controller.dart';
import 'package:pucextrato/app/modules/login/controllers/login_controller.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_service.dart';
import 'package:pucextrato/app/modules/saldoContas/controllers/saldo_contas_controller.dart';
import 'package:pucextrato/app/modules/saldoProjetos/controllers/saldo_projetos_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(CoordenadorController());
  Get.put(ProjetosController());
  Get.put(LoginController());
  Get.put(ProjetosService());
  Get.put(ExtratoProjetosController());
  Get.put(SaldoProjetosController());
  Get.put(SaldoContasController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Portuguese
        Locale('en', 'US'), // English
        Locale('es'), // Spanish
      ],
    ),
  );
}
