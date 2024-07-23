import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:get/get.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_service.dart';
import 'package:pucextrato/app/modules/projetos/model/projeto_model.dart';

class ProjetosController extends GetxController {
  static ProjetosService projetoService = Get.put(ProjetosService());

  final Rx<ProjetoModel> _projeto = const ProjetoModel().obs;
  ProjetoModel get projeto => _projeto.value;

  final _listaProjetos = <ProjetoModel>[].obs;
  RxList<ProjetoModel> get lista => _listaProjetos;
  set listaProjetos(value) => _listaProjetos.value = value;

  RxInt idProjeto = 0.obs;
  RxString nome = ''.obs;

  List<DropDownValueModel> get dropDownList {
    return (projetoService.dropDownList(_listaProjetos));
  }

  listaProjetosCoordenador() async {
    projetoService.listaProjetosCoordenador().then((l) => {
          _listaProjetos.value = l,
        });
  }

  @override
  void refresh() {
    super.refresh();
    _listaProjetos.refresh();
  }
}
