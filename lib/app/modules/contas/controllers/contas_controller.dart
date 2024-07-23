import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:pucextrato/app/modules/contas/controllers/contas_service.dart';
import 'package:pucextrato/app/modules/contas/model/contas.model.dart';

class ContasController extends GetxController {
  ContasModel conta = Get.put(const ContasModel());

  RxString contaAtual = ''.obs;
  RxString contaDescricao = ''.obs;

  ContasService service = Get.put(ContasService());
  final _lista = <ContasModel>[].obs;
  RxList<ContasModel> get lista => _lista;

  RxList<ContasModel> getContas() {
    RxList<ContasModel> result = RxList<ContasModel>.empty();
    service.getContas().then((value) => _lista.value = value);
    return result;
  }

  List<DropDownValueModel> dropDownList() {
    List<DropDownValueModel> retorno = [];
    for (var element in _lista) {
      DropDownValueModel d = DropDownValueModel(
          name: element.descricao.toString(), value: element.conta);
      retorno.add(d);
    }
    return retorno;
  }
}
