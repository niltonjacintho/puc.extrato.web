import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/total_contas_controller.dart';

class TotalContasView extends GetView<TotalContasController> {
  const TotalContasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TotalContasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TotalContasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
