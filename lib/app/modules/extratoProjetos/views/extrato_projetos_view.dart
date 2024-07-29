import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/projetos/controllers/projetos_controller.dart';
import '../controllers/extrato_projetos_controller.dart';

class ExtratoProjetosView extends GetView<ExtratoProjetosController> {
  // static TextEditingController jobRoleCtrl = TextEditingController();
  ExtratoProjetosView({super.key});
  final ProjetosController projetos = Get.put(ProjetosController());
  static ConfigController config = Get.put(ConfigController());
  ExtratoProjetosController extrato = Get.put(ExtratoProjetosController());
  @override
  Widget build(BuildContext context) {
    extrato.rows.clear();
    config.inicializarDatas();
    // controller.ex
    projetos.idProjeto.listen((p) {
      controller.getExtratoProjetosService();
    });

    config.fimPeriodo.listen((p0) {
      controller.getExtratoProjetosService();
    });

    config.inicioPeriodo.listen((p0) {
      controller.getExtratoProjetosService();
    });

    final columns = <PlutoColumn>[
      PlutoColumn(
        textAlign: PlutoColumnTextAlign.center,
        width: config.width(context, 10),
        title: 'Data',
        field: 'data',
        type: PlutoColumnType.date(
          format: 'dd/MM/yyyy',
        ),
      ),
      PlutoColumn(
        width: config.width(context, 17.5),
        title: 'Fatura',
        field: 'fatura',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        width: config.width(context, 40),
        title: 'Histórico',
        field: 'texto',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        width: config.width(context, 10),
        textAlign: PlutoColumnTextAlign.right,
        title: 'Receita',
        field: 'receita',
        type: PlutoColumnType.currency(
            symbol: '', locale: 'pt-BR', format: '###,###,##0.00'),
      ),
      PlutoColumn(
        width: config.width(context, 10),
        textAlign: PlutoColumnTextAlign.right,
        title: 'Despesa',
        field: 'despesa',
        type: PlutoColumnType.currency(
            symbol: '', locale: 'pt-BR', format: '###,###,##0.00'),
      ),
      PlutoColumn(
        width: config.width(context, 10),
        textAlign: PlutoColumnTextAlign.right,
        title: 'Saldo',
        field: 'saldo',
        type: PlutoColumnType.currency(
            symbol: '', locale: 'pt-BR', format: '###,###,##0.00'),
        footerRenderer: (rendererContext) {
          return PlutoAggregateColumnFooter(
            locale: 'pt-BR',
            rendererContext: rendererContext,
            formatAsCurrency: true,
            type: PlutoAggregateColumnType.sum,
            format: '###,###,##0.00',
            alignment: Alignment.center,
            titleSpanBuilder: (text) {
              return [
                const TextSpan(
                  text: 'Total ',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(text: ' : '),
                TextSpan(text: text),
              ];
            },
          );
        },
      ),
    ].obs;

    final RxList<PlutoRow> rows = controller.rows;

    FocusNode textFieldFocusNode = FocusNode();
    FocusNode searchFocusNode = FocusNode();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: DropDownTextField(
                        clearOption: true,
                        textFieldDecoration: const InputDecoration(
                            label: Text('Escolha o projeto'),
                            border: OutlineInputBorder()),
                        textFieldFocusNode: textFieldFocusNode,
                        searchFocusNode: searchFocusNode,
                        searchDecoration: const InputDecoration(
                            label: Text(
                                'Entre com um nome ou selecione na lista')),
                        dropDownItemCount: 8,
                        searchShowCursor: false,
                        enableSearch: true,
                        searchKeyboardType: TextInputType.text,
                        dropDownList: projetos.dropDownList,
                        onChanged: (val) {
                          projetos.idProjeto.value = val.value;
                          projetos.nome.value = val.name;
                        },
                      ),
                    ),
                  ),
                ),
                config.wgtDataInicial(context),
                const SizedBox(
                  width: 10,
                ),
                config.wgtDataFinal(context),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Visibility(
                      visible: rows.isNotEmpty,
                      child: AnimatedButtonBar(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 11, 71, 13),
                        radius: 8.0,
                        padding: const EdgeInsets.all(8.0),
                        invertedSelection: true,
                        children: [
                          ButtonBarEntry(
                            onTap: () async {
                              controller.getProjetoExcel();
                            },
                            child: const Text('Exportar Excel'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: Obx(
                () => PlutoGrid(
                  mode: PlutoGridMode.readOnly,
                  noRowsWidget: const Center(
                    child: Text('Favor selecionar o projeto'),
                  ),
                  configuration: const PlutoGridConfiguration(
                      localeText: PlutoGridLocaleText.brazilianPortuguese(),
                      columnSize: PlutoGridColumnSizeConfig(
                          autoSizeMode: PlutoAutoSizeMode.scale,
                          resizeMode: PlutoResizeMode.pushAndPull)),
                  columns: columns,
                  rows: controller.rows.value,
                  onLoaded: (PlutoGridOnLoadedEvent event) {},
                  onChanged: (PlutoGridOnChangedEvent event) {
                    null;
                  },
                  // configuration: const PlutoGridConfiguration(),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
