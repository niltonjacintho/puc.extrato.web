import 'package:get/get.dart';

import '../controllers/total_contas_controller.dart';

class TotalContasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalContasController>(
      () => TotalContasController(),
    );
  }
}
