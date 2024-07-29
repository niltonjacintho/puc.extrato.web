import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:pucextrato/app/modules/general/config.dart';

import '../controllers/saldo_contas_controller.dart';

class SaldoContasView extends GetView<SaldoContasController> {
  const SaldoContasView({super.key});
  static ConfigController config = Get.put(ConfigController());

  @override
  Widget build(BuildContext context) {
    late PlutoGridStateManager stateManager;
    config.inicializarDatas();
    controller.clearRows();

    final List<PlutoColumn> columns = <PlutoColumn>[
      PlutoColumn(
        width: config.width(context, 80),
        title: 'Conta',
        field: 'conta',
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

    config.fimPeriodo.listen((p0) {
      controller.getExtrato();
    });

    return WillPopScope(
      onWillPop: () {
        return controller.getExtrato();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 60, child: config.wgtDataFinal(context)),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: Obx(
                  () => PlutoGrid(
                    noRowsWidget: const Center(
                      child: Text('Não encontrei dados para o período ativo '),
                    ),
                    configuration: const PlutoGridConfiguration(
                        columnSize: PlutoGridColumnSizeConfig(
                            autoSizeMode: PlutoAutoSizeMode.scale,
                            resizeMode: PlutoResizeMode.pushAndPull)),
                    columns: columns,
                    rows: rows.value,
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      stateManager = event.stateManager;
                    },
                    onChanged: (PlutoGridOnChangedEvent event) {
                      null;
                    },
                    // configuration: const PlutoGridConfiguration(),
                  ),
                ),
              ),
            ],
          ),
        ),
        //),
      ),
    );
  }
}
