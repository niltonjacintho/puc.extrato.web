import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/saldoContas/controllers/saldo_contas_service.dart';

class SaldoContasController extends GetxController {
  SaldoContasService saldoContasService = Get.put(SaldoContasService());
  CoordenadorController coordenadorController =
      Get.put(CoordenadorController());

  static RxList<PlutoRow> _rows = RxList<PlutoRow>([]);

  RxList<PlutoRow> get rows {
    return _rows;
  }

  set rows(RxList<PlutoRow> value) {
    _rows.value = value;
  }

  clearRows() {
    _rows = RxList<PlutoRow>([]);
  }

  bool get hasRows {
    return _rows.isNotEmpty;
  }

  getExtrato() async {
    if (coordenadorController.idCoordenador.value != 0) {
      await saldoContasService.getExtrato().then((value) {
        _rows.clear();
        for (var element in value) {
          _rows.add(element);
        }
      });
    }
  }
}
