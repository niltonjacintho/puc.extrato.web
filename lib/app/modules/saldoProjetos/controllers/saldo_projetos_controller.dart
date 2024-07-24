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

  getExtratoExcel(
      String coordenador, String conta, String nomeConta, DateTime data) async {
    nomeConta = nomeConta.split('-')[1].trim();
    String dt =
        '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';

    await saldoProjetosService.getExcel(coordenador, conta, nomeConta, dt);
  }

  @override
  void refresh() {
    super.refresh();
    _rows.refresh();
  }
}
