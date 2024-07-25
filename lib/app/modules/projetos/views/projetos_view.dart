import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/projetos_controller.dart';

class ProjetosView extends GetView<ProjetosController> {
  const ProjetosView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjetosView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjetosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
