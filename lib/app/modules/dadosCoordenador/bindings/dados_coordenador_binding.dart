import 'package:get/get.dart';

import '../controllers/dados_coordenador_controller.dart';

class DadosCoordenadorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DadosCoordenadorController>(
      () => DadosCoordenadorController(),
    );
  }
}
