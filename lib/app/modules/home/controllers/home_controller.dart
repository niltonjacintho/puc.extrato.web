import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as universal_html;

class HomeController extends GetxController {
  final count = 0.obs;
  Dio dio = Dio();

  void increment() => count.value++;

  getApk(BuildContext context) async {
    const url =
        "./assets/app/extrato.apk"; //"http://139.82.24.10/ExtratoWeb/extratoAPK/extrato.apk";
    const fileName = "extrato.apk";
    const dataType = "application/octet-stream";
    try {
      final response = await dio.get(Uri.parse(url).toString(),
          options: Options(
            responseType: ResponseType.bytes,
          ));
      final base64 = base64Encode(response.data);
      final anchor = universal_html.AnchorElement(
          href: 'data:application/octet-stream;base64,$base64')
        ..target = 'blank';

      anchor.download = fileName.trim();
      universal_html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();

      await showStyledToast(
          child: const Text(
            'Aplicativo Extrato baixado com êxito',
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          context: context,
          backgroundColor: Colors.green[900],
          contentPadding: const EdgeInsets.all(30),
          animationBuilder: (context, animation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          });
    } catch (e) {
      print(e);
    }
  }
}
