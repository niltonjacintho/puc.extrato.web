import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pucextrato/app/modules/extratoProjetos/views/extrato_projetos_view.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/general/estilos.dart';
import 'package:pucextrato/app/modules/saldoContas/views/saldo_contas_view.dart';
import 'package:pucextrato/app/modules/saldoProjetos/views/saldo_projetos_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  static Estilos estilo = Estilos.instance;
  static ConfigController config = Get.put(ConfigController());

  @override
  Widget build(BuildContext context) {
    var tabIndex = 0.obs;
    final pageKey = GlobalKey();

    late PageController pageController;
    double largura = MediaQuery.of(context).size.width;
    pageController = PageController(initialPage: tabIndex.value);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Fundação Padre Leonel Franca - Controle de Projetos '),
          actions: [
            ElevatedButton(
              onPressed: () {
                tabIndex.value = 0;
                pageController.jumpToPage(tabIndex.value);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(largura * 0.1, 30),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Início'),
            ),
            //  const Spacer(),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                tabIndex.value = 1;
                pageController.jumpToPage(tabIndex.value);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(largura * 0.1, 30),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Extrato'),
            ),
            //  const Spacer(),
            ElevatedButton(
              onPressed: () {
                tabIndex.value = 2;
                pageController.jumpToPage(tabIndex.value);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(largura * 0.1, 30),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Saldo dos projetos'),
            ),
            //   const Spacer(),
            ElevatedButton(
              onPressed: () {
                tabIndex.value = 3;
                pageController.jumpToPage(tabIndex.value);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(largura * 0.1, 30),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Saldo das contas'),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: PageView(
            controller: pageController,
            key: pageKey,
            onPageChanged: (v) {
              tabIndex.value = v;
            },
            children: [
              Container(
                width: double.infinity,
                //    height: double.infinity,
                color: const Color.fromARGB(255, 245, 243, 243),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  child: Image.asset(
                    './assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                //     height: double.infinity,
                color: Colors.green,
                child: ExtratoProjetosView(),
              ),
              Container(
                  width: double.infinity,
                  //       height: double.infinity,
                  color: Colors.blue,
                  child: const SaldoProjetosView()),
              Container(
                  width: double.infinity,
                  //     height: double.infinity,
                  color: Colors.blue,
                  child: const SaldoContasView()),
            ],
          ),
        ),
      ),
    );
  }
}
