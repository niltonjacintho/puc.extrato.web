import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/contas/controllers/contas_controller.dart';
import 'package:pucextrato/app/modules/general/config.dart';
import 'package:pucextrato/app/modules/login/controllers/login_controller.dart';

import '../controllers/saldo_projetos_controller.dart';

class SaldoProjetosView extends GetView<SaldoProjetosController> {
  const SaldoProjetosView({super.key});
  static ContasController contas = Get.put(ContasController());
  static ConfigController config = Get.put(ConfigController());
  static LoginController login = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    void rebuildAllChildren(BuildContext context) {
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }

      (context as Element).visitChildren(rebuild);
    }

    rebuildAllChildren(context);
    final List<PlutoColumn> columns = <PlutoColumn>[
      PlutoColumn(
        width: config.width(context, 80),
        title: 'Conta',
        field: 'nomeProjeto',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        width: config.width(context, 20),
        textAlign: PlutoColumnTextAlign.right,
        title: 'Saldo',
        field: 'saldo',
        type: PlutoColumnType.currency(
            symbol: '', locale: 'pt-BR', format: '###,###,##0.00'),
        footerRenderer: (rendererContext) {
          return PlutoAggregateColumnFooter(
            rendererContext: rendererContext,
            formatAsCurrency: false,
            locale: 'pt-BR',
            type: PlutoAggregateColumnType.sum,
            format: '###,###,##0.00',
            alignment: Alignment.centerRight,
            titleSpanBuilder: (text) {
              return [
                const TextSpan(
                  text: 'Total',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(text: ' : '),
                TextSpan(text: text),
              ];
            },
          );
        },
      ),
    ];

    final RxList<PlutoRow> rows = controller.rows;

    FocusNode textFieldFocusNode = FocusNode();
    FocusNode searchFocusNode = FocusNode();

    SingleValueDropDownController dropController =
        SingleValueDropDownController();
    controller.rows.clear();
    config.inicializarDatas();
    contas.contaAtual.listen((p0) async {
      await controller.getExtrato();
      // dropController.clearDropDown();
      // dropController.dropDownValue = null;
    });

    config.inicioPeriodo.listen((p0) async {
      // dropController.clearDropDown();
      await controller.getExtrato();
    });

    config.fimPeriodo.listen((p0) async {
      // dropController.clearDropDown();
      await controller.getExtrato();
    });

    dropController.addListener(() async => {
          // print('chamou'),
          // print('will dispose ${dropController.dropDownValue}'),
          await controller.getExtrato(),
          dropController.clearDropDown(),
          dropController.dropDownValue = null,
          // print('after dispose ${dropController.dropDownValue}'),
        } as VoidCallback);

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
                    () => DropDownTextField(
                      controller: dropController,
                      clearOption: true,
                      textFieldDecoration: const InputDecoration(
                          label: Text('Escolha a conta'),
                          border: OutlineInputBorder()),
                      textFieldFocusNode: textFieldFocusNode,
                      searchFocusNode: searchFocusNode,
                      dropDownItemCount: 8,
                      searchShowCursor: false,
                      enableSearch: true,
                      searchKeyboardType: TextInputType.text,
                      searchDecoration: const InputDecoration(
                          label:
                              Text('Entre com um nome ou selecione na lista')),
                      dropDownList: contas.dropDownList(),
                      onChanged: (val) {
                        contas.contaAtual.value = val.value;
                        contas.contaDescricao.value = val.name;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // config.wgtDataInicial(context),
                config.wgtDataFinal(context),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Visibility(
                      visible: controller.rows.isNotEmpty,
                      child: AnimatedButtonBar(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color.fromARGB(255, 11, 71, 13),
                        radius: 8.0,
                        padding: const EdgeInsets.all(8.0),
                        invertedSelection: true,
                        children: [
                          ButtonBarEntry(
                            onTap: () async {
                              controller.getExtratoExcel(
                                  login.usuario.value,
                                  contas.contaAtual.value,
                                  contas.contaDescricao.value,
                                  config.fimPeriodo.value);
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
            Expanded(
              child: Obx(
                () => PlutoGrid(
                  noRowsWidget: const Center(
                    child: Text(
                      'Por favor, selecione uma conta no menu acima!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  configuration: const PlutoGridConfiguration(
                      columnSize: PlutoGridColumnSizeConfig(
                          autoSizeMode: PlutoAutoSizeMode.scale,
                          resizeMode: PlutoResizeMode.pushAndPull)),
                  columns: columns,
                  rows: rows.value,
                  onLoaded: (PlutoGridOnLoadedEvent event) {},
                  onChanged: (PlutoGridOnChangedEvent event) {
                    print(event);
                  },
                  // configuration: const PlutoGridConfiguration(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
