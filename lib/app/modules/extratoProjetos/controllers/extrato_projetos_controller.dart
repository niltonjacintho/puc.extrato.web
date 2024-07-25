import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/extratoProjetos/controllers/extrato_projetos_service.dart';
import 'package:pucextrato/app/modules/extratoProjetos/model/extrato_model.dart';

class ExtratoProjetosController extends GetxController {
  ExtratoProjetosService extratoService = Get.put(ExtratoProjetosService());

  final _extratoModel = ExtratoModel().obs;
  ExtratoModel get extratoModel => _extratoModel.value;

  final _listExtrato = <ExtratoModel>[].obs;
  List<ExtratoModel> get listaExtrato => _listExtrato.value;

  final RxList<PlutoRow> _rows = RxList<PlutoRow>([]);

  RxList<PlutoRow> get rows {
    return _rows;
  }

  bool get hasRows {
    return _rows.isNotEmpty;
  }

  getExtratoProjetosService() {
    extratoService.getExtratoProjetosService();
  }

  getProjetoExcel() {
    extratoService.getExtratoExcel();
  }

  @override
  void refresh() {
    super.refresh();
    _rows.refresh();
  }
}
