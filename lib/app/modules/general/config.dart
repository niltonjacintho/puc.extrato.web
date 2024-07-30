import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:universal_html/html.dart' as universal_html;

class ConfigController extends GetxController {
  Dio dio = Dio();
  String urlPadrao = 'http://139.82.24.10/MobServ/api/';
  String urlPadraoBase = 'http://139.82.24.10/';
  String _NomeModuloAtual = '';
  String get NomeModuloAtual => _NomeModuloAtual;

  Rx<DateTime> inicioPeriodo =
      DateTime.now().subtract(const Duration(days: 30)).obs;
  Rx<DateTime> fimPeriodo = DateTime.now().obs;

  inicializarDatas() {
    inicioPeriodo = DateTime.now().subtract(const Duration(days: 30)).obs;
    fimPeriodo = DateTime.now().obs;
  }

  double width(BuildContext context, double perc) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (perc / 100);
  }

  String isoDate(DateTime data) {
    return '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
  }

  Widget wgtDataInicial(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 1,
        child: FormBuilderDateTimePicker(
          name: 'dt_inicio',
          locale: const Locale('pt', 'BR'),
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDate: inicioPeriodo.value,
          initialValue: inicioPeriodo.value,
          inputType: InputType.date, // This is crucial for selecting only date
          format: DateFormat('dd/MM/yyyy'),
          decoration: const InputDecoration(
              labelText: 'Data Inicial', border: OutlineInputBorder()),

          onChanged: (val) {
            inicioPeriodo.value = val!;
          },
        ),
      ),
    );
  }

  Widget wgtDataFinal(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 1,
        child: FormBuilderDateTimePicker(
          name: 'dt_final',
          locale: const Locale('pt', 'BR'),
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDate: fimPeriodo.value,
          initialValue: fimPeriodo.value,
          inputType: InputType.date, // This is crucial for selecting only date
          format: DateFormat('dd/MM/yyyy'),
          decoration: const InputDecoration(
              labelText: 'Data Final', border: OutlineInputBorder()),
          onChanged: (val) {
            fimPeriodo.value = val!;
          },
        ),
      ),
    );
  }

  Future<void> downloadFile(
      {required String url,
      required String fileName,
      required String dataType}) async {
    try {
      final exten = fileName.contains('.xls') ? '' : '.xls';
      final response = await dio.get(Uri.parse(url).toString(),
          options: Options(
            responseType: ResponseType.bytes,
          ));
      final base64 = base64Encode(response.data);
      final anchor = universal_html.AnchorElement(
          href: 'data:application/octet-stream;base64,$base64')
        ..target = 'blank';

      anchor.download = '${fileName.trim()}' + exten;
      universal_html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();
    } catch (e) {
      print(e);
    }
  }
}
