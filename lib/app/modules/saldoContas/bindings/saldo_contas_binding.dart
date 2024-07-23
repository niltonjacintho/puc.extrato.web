import 'package:get/get.dart';

import '../controllers/saldo_contas_controller.dart';

class SaldoContasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaldoContasController>(
      () => SaldoContasController(),
    );
  }
}
