import 'package:flutter/material.dart';

enum botao { normal, error }

class Editors extends StatefulWidget {
  const Editors({Key? key}) : super(key: key);

  Color _getCor(botao value) {
    Color result = const Color.fromARGB(255, 3, 45, 80);
    switch (value) {
      case botao.error:
        result = const Color.fromARGB(255, 82, 8, 2);
        break;
      case botao.normal:
        result = const Color.fromARGB(255, 4, 31, 53);
        break;
      default:
        result = const Color.fromARGB(255, 3, 45, 80);
    }
    return result;
  }

  // Icon _getIcon(botao value) {
  //   Icon result = const Icon(Icons.one_k);
  //   switch (value) {
  //     case botao.error:
  //       result = const Icon(Icons.cancel);
  //       break;
  //     default:
  //   }
  //   return result;
  // }

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

  ButtonStyle buttonStyle(botao tipo) {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: _getCor(tipo),
      minimumSize: const Size(200, 80),
      fixedSize: const Size(200, 80),
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
