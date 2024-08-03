import 'package:get/get.dart';

import '../controllers/extrato_multi_controller.dart';

class ExtratoMultiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExtratoMultiController>(
      () => ExtratoMultiController(),
    );
  }
}
