import 'package:get/get.dart';
import 'package:pucextrato/app/modules/login/controllers/login.services.dart';

class LoginController extends GetxController {

  LoginServices loginServices = Get.put(LoginServices());
  //TODO: Implement LoginController

  RxInt count = 0.obs;

  RxString usuario = ''.obs;
  RxString senha = ''.obs;

  void increment() => count.value++;
}
