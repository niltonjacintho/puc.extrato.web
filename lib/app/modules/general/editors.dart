import 'package:flutter/material.dart';

enum Botao { normal, error }

class Editors extends StatefulWidget {
  const Editors({super.key});

  Color _getCor(Botao value) {
    Color result = const Color.fromARGB(255, 3, 45, 80);
    switch (value) {
      case Botao.error:
        result = const Color.fromARGB(255, 240, 33, 15);
        break;
      case Botao.normal:
        result = const Color.fromARGB(255, 56, 214, 16);
        break;
      default:
        result = const Color.fromARGB(255, 13, 109, 10);
    }
    return result;
  }

  @override
  _EditorsState createState() => _EditorsState();

  Widget editorText(String titulo, {bool isPassWord = false}) {
    return TextFormField(
      obscureText: isPassWord,
      decoration: InputDecoration(labelText: titulo),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Entre com o usuário';
        }
        return null;
      },
    );
  }

  ButtonStyle buttonStyle(Botao tipo) {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: _getCor(tipo),
      minimumSize: const Size(200, 40),
      fixedSize: const Size(200, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _EditorsState extends State<Editors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }

  Widget editorText(String titulo) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Usuario'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Entre com o usuário';
        }
        return null;
      },
    );
  }
}
