import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pucextrato/app/modules/coordenador/controllers/coordenador_controller.dart';
import 'package:pucextrato/app/modules/general/editors.dart';
import 'package:pucextrato/app/modules/general/estilos.dart';
import 'package:pucextrato/app/modules/home/views/home_view.dart';
import 'package:pucextrato/app/modules/login/controllers/login.services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controllers/login_controller.dart';

final _formKey = GlobalKey();

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  static Estilos estilo = Estilos.instance;
  static Editors editors = const Editors();
  @override
  Widget build(BuildContext context) {
    var obscureText = true.obs;

    CoordenadorController coordenadorController =
        Get.put(CoordenadorController());
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                if (constraints.maxWidth >= 900)
                  const Expanded(
                    flex: 2,
                    child: Image(
                      image: AssetImage('./assets/images/logo.jpg'),
                      width: 500,
                      height: 500,
                    ),
                  ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 80),
                      SizedBox(
                        height: 80,
                        child: Text(
                          "Acessar o sistema",
                          textAlign: TextAlign.center,
                          style: estilo.titulo,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Form(
                          key: _formKey,
                          child: Wrap(
                            spacing: 30,
                            runSpacing: 30,
                            children: [
                              TextFormField(
                                obscureText: false,
                                decoration:
                                    const InputDecoration(labelText: 'Usuário'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entre com o usuário';
                                  }
                                  return null;
                                },
                                onChanged: (value) => controller.usuario.value = value,
                              ),
                              Obx(
                                () => TextFormField(
                                  obscureText: obscureText.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        obscureText.value = !obscureText.value;
                                      },
                                      child: Icon(obscureText.value
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'É necessário informar a senha';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => controller.senha.value = value,
                                ),
                              ),
                              ButtonBar(
                                //alignment: WrapAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      print('ok');
                                    },
                                    label: const Text('Cancelar'),
                                    icon: const Icon(Icons.cancel),
                                    style: editors.buttonStyle(botao.error),
                                  ),
                                  // const Spacer(),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      LoginServices serv = LoginServices();
                                      serv.login().then(
                                            (value) async => {
                                              if (value == 200)
                                                {
                                                  Get.off(
                                                      () => const HomeView()),
                                                }
                                              else
                                                {
                                                  showTopSnackBar(
                                                    Overlay.of(context),
                                                    CustomSnackBar.error(
                                                      textStyle:
                                                          estilo.textoPadrao,
                                                      message:
                                                          "Usuário ou senha inválidos",
                                                    ),
                                                  ),
                                                },
                                            },
                                          );
                                    },
                                    label: const Text('Entrar'),
                                    icon: const Icon(Icons.cancel),
                                    style: editors.buttonStyle(botao.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
