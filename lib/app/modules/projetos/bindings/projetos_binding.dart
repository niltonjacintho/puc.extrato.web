import 'package:get/get.dart';

import '../controllers/projetos_controller.dart';

class ProjetosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjetosController>(
      () => ProjetosController(),
    );
  }
}
