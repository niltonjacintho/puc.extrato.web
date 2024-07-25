import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contas_controller.dart';

class ContasView extends GetView<ContasController> {
  const ContasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
