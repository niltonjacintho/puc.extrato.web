import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coordenador_controller.dart';

class CoordenadorView extends GetView<CoordenadorController> {
  const CoordenadorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoordenadorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CoordenadorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
