import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contas_controller.dart';

class ContasView extends GetView<ContasController> {
  const ContasView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
