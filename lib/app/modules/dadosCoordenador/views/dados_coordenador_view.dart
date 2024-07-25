import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dados_coordenador_controller.dart';

class DadosCoordenadorView extends GetView<DadosCoordenadorController> {
  const DadosCoordenadorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DadosCoordenadorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DadosCoordenadorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
