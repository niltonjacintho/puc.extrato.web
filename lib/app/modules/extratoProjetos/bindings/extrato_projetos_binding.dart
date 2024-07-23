import 'package:get/get.dart';

import '../controllers/extrato_projetos_controller.dart';

class ExtratoProjetosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExtratoProjetosController>(
      () => ExtratoProjetosController(),
    );
  }
}
