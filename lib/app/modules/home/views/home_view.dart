import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:pucextrato/app/modules/extratoMulti/views/extrato_multi_view.dart';
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
  static HomeController home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    late PageController pageController;
    double largura = MediaQuery.of(context).size.width;
    var tabIndex = 0.obs;
    pageController = PageController(initialPage: tabIndex.value);
    late final List<PlutoMenuItem> orangeHoverMenus;

    List<PlutoMenuItem> makeMenus(BuildContext context) {
      return [
        PlutoMenuItem(
          title: 'Início',
          icon: Icons.home,
          onTap: () =>
              {tabIndex.value = 0, pageController.jumpToPage(tabIndex.value)},
        ),
        PlutoMenuItem(
          title: 'Extrato Projetos',
          icon: Icons.account_balance_rounded,
          onTap: () =>
              {tabIndex.value = 1, pageController.jumpToPage(tabIndex.value)},
        ),
        PlutoMenuItem(
          title: 'Multiplos Extratos',
          icon: Icons.account_tree_rounded,
          onTap: () =>
              {tabIndex.value = 4, pageController.jumpToPage(tabIndex.value)},
        ),
        PlutoMenuItem(
          title: 'Saldo dos projetos',
          icon: Icons.analytics_rounded,
          onTap: () =>
              {tabIndex.value = 2, pageController.jumpToPage(tabIndex.value)},
        ),
        PlutoMenuItem(
          title: 'Saldo das contas',
          icon: Icons.attach_money_rounded,
          onTap: () =>
              {tabIndex.value = 3, pageController.jumpToPage(tabIndex.value)},
        ),
        PlutoMenuItem(
            title: 'Baixar APP',
            icon: Icons.android_rounded,
            onTap: () => {home.getApk(context)}),
      ];
    }

    orangeHoverMenus = makeMenus(context);

    final pageKey = GlobalKey();
//TODO: REVER ESTE GLOBAL KEY
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text(
              'Fundação Padre Leonel Franca - Controle de Projetos ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            PlutoMenuBar(
              mode: PlutoMenuBarMode.hover,
              backgroundColor: const Color(0xff00005a),
              itemStyle: const PlutoMenuItemStyle(
                activatedColor: Colors.white,
                indicatorColor: Colors.deepOrange,
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
                moreIconColor: Colors.white,
                enableSelectedTopMenu: true,
              ),
              menus: orangeHoverMenus,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: pageController,
                //  key: pageKey,
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
                  Container(
                      width: double.infinity,
                      //     height: double.infinity,
                      color: Colors.blue,
                      child: ExtratoMultiView()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
