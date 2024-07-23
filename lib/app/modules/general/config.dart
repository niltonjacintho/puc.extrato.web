import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConfigController extends GetxController {
  String urlPadrao = 'http://139.82.24.10/MobServ/api/';
  final _formKey = GlobalKey<FormBuilderState>();
  Rx<DateTime> inicioPeriodo =
      DateTime.now().subtract(const Duration(days: 30)).obs;
  Rx<DateTime> fimPeriodo = DateTime.now().obs;

  double width(BuildContext context, double perc) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (perc / 100);
  }

  Widget wgtDataInicial(BuildContext context) {
    return Obx(
      () => Expanded(
        flex: 1,
        child: FormBuilder(
          key: _formKey,
          child: FormBuilderDateTimePicker(
            name: 'dt_inicio',
            initialEntryMode: DatePickerEntryMode.calendar,
            initialDate: inicioPeriodo.value,
            inputType:
                InputType.date, // This is crucial for selecting only date
            format: DateFormat('dd/MM/yyyy'),
            decoration: const InputDecoration(labelText: 'Data Inicial'),
            onChanged: (val) {
              inicioPeriodo.value = val!;
            },
          ),
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
          initialEntryMode: DatePickerEntryMode.calendar,
          initialDate: fimPeriodo.value,
          inputType: InputType.date, // This is crucial for selecting only date
          format: DateFormat('dd/MM/yyyy'),
          decoration: const InputDecoration(labelText: 'Data Final'),
          onChanged: (val) {
            fimPeriodo.value = val!;
          },
        ),
      ),
    );
  }
}
