import 'package:get/get.dart';

import '../controllers/saldo_projetos_controller.dart';

class SaldoProjetosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaldoProjetosController>(
      () => SaldoProjetosController(),
    );
  }
}
