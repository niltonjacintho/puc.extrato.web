import 'package:get/get.dart';
import 'package:pucextrato/app/modules/coordenador/model/coordenador.model.dart';

class CoordenadorController extends GetxController {
  RxInt i = 0.obs;

  final _coordenador = CoordenadorModel().obs;
  CoordenadorModel get coordenador => _coordenador.value;

  final RxInt _idCoordenador = 0.obs;
  RxInt get idCoordenador => _idCoordenador;

  @override
  void onInit() {
    super.onInit();
    var coordenador =
        CoordenadorModel(coordenador: 1, nome: 'ffsdfsdfsd', email: '');
    _coordenador(coordenador);
  }

  @override
  void refresh() {
    super.refresh();
    _coordenador.refresh();
  }
}
