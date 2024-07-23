import 'package:get/get.dart';

import '../controllers/coordenador_controller.dart';

class CoordenadorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoordenadorController>(
      () => CoordenadorController(),
    );
  }
}
