import 'package:get/get.dart';

import '../controllers/contas_controller.dart';

class ContasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContasController>(
      () => ContasController(),
    );
  }
}
