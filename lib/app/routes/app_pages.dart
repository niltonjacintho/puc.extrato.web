import 'package:get/get.dart';

import '../modules/contas/bindings/contas_binding.dart';
import '../modules/contas/views/contas_view.dart';
import '../modules/coordenador/bindings/coordenador_binding.dart';
import '../modules/coordenador/views/coordenador_view.dart';
import '../modules/dadosCoordenador/bindings/dados_coordenador_binding.dart';
import '../modules/dadosCoordenador/views/dados_coordenador_view.dart';
import '../modules/extratoMulti/bindings/extrato_multi_binding.dart';
import '../modules/extratoMulti/views/extrato_multi_view.dart';
import '../modules/extratoProjetos/bindings/extrato_projetos_binding.dart';
import '../modules/extratoProjetos/views/extrato_projetos_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/projetos/bindings/projetos_binding.dart';
import '../modules/projetos/views/projetos_view.dart';
import '../modules/saldoContas/bindings/saldo_contas_binding.dart';
import '../modules/saldoContas/views/saldo_contas_view.dart';
import '../modules/saldoProjetos/bindings/saldo_projetos_binding.dart';
import '../modules/saldoProjetos/views/saldo_projetos_view.dart';
import '../modules/totalContas/bindings/total_contas_binding.dart';
import '../modules/totalContas/views/total_contas_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.COORDENADOR,
      page: () => const CoordenadorView(),
      binding: CoordenadorBinding(),
    ),
    GetPage(
      name: _Paths.EXTRATO_PROJETOS,
      page: () => ExtratoProjetosView(),
      binding: ExtratoProjetosBinding(),
    ),
    GetPage(
      name: _Paths.SALDO_PROJETOS,
      page: () => const SaldoProjetosView(),
      binding: SaldoProjetosBinding(),
    ),
    GetPage(
      name: _Paths.TOTAL_CONTAS,
      page: () => const TotalContasView(),
      binding: TotalContasBinding(),
    ),
    GetPage(
      name: _Paths.DADOS_COORDENADOR,
      page: () => const DadosCoordenadorView(),
      binding: DadosCoordenadorBinding(),
    ),
    GetPage(
      name: _Paths.PROJETOS,
      page: () => const ProjetosView(),
      binding: ProjetosBinding(),
    ),
    GetPage(
      name: _Paths.CONTAS,
      page: () => const ContasView(),
      binding: ContasBinding(),
    ),
    GetPage(
      name: _Paths.SALDO_CONTAS,
      page: () => const SaldoContasView(),
      binding: SaldoContasBinding(),
    ),
    GetPage(
      name: _Paths.EXTRATO_MULTI,
      page: () =>  ExtratoMultiView(),
      binding: ExtratoMultiBinding(),
    ),
  ];
}
