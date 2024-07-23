import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/saldoProjetos/controllers/saldo_projetos_service.dart';
import 'package:pucextrato/app/modules/saldoProjetos/model/saldo_projeto_model.dart';

class SaldoProjetosController extends GetxController {
  SaldoProjetosService saldoProjetosService = Get.put(SaldoProjetosService());

  final _listExtrato = <SaldoProjetoModel>[].obs;
  RxList<SaldoProjetoModel> get listaExtrato => _listExtrato;

  final RxList<PlutoRow> _rows = RxList<PlutoRow>([]);

  RxList<PlutoRow> get rows {
    return _rows;
  }

  bool get hasRows {
    return _rows.isNotEmpty;
  }

  getExtrato() async {
    await saldoProjetosService.getExtrato();
  }

  @override
  void refresh() {
    super.refresh();
    _rows.refresh();
  }
}
