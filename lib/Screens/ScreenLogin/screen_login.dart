import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Colors/customized_colors_global.dart';
import '../../Components/comp_app_bar.dart';
import '../../Components/comp_button.dart';
import '../../Components/comp_input.dart';
import '../../Global/api_service.dart';
import '../../Global/profile_authenticated.dart';
import '../../Global/shared_preferences.dart';
import '../../Global/token.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  InstanceSharedPreference sharedPreferences = InstanceSharedPreference();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const ComponentAppBar(),
        body: Column(children: [
          Flexible(
            child: Container(),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ComponentInput(
                  labelText: 'Usuario',
                  controller: _userController,
                  validator: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ComponentInput(
                  //Senha
                  obscureText: !_visiblePassword,
                  labelText: 'Senha',
                  controller: _passwordController,
                  validator: true,
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: _visiblePassword
                        ? const Icon(
                            Icons.visibility_sharp,
                            size: 23,
                          )
                        : const Icon(
                            Icons.visibility_off_sharp,
                            // size: 23,
                          ),
                    color: Colors.grey,
                    // style: const ButtonStyle(),
                    onPressed: () {
                      setState(
                        () {
                          _visiblePassword = !_visiblePassword;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Não tem uma conta? ",
                        style: TextStyle(fontFamily: 'Imprima-Regular'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: CustomizedColors.darkBackground),
                        onPressed: () async {
                          await Get.toNamed("/cadastro");
                        },
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                              color: CustomizedColors.blueText,
                              fontFamily: 'Imprima-Regular'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              //Texto e Botao
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  //Texto
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(fontFamily: 'Imprima-Regular'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: CustomizedColors.darkBackground,
                      ),
                      onPressed: () async {
                        //IMPLEMENTAR Navigator para pagina de trocar senha
                      },
                      child: Text(
                        "Recuperar",
                        style: TextStyle(
                            color: CustomizedColors.blueText,
                            fontFamily: 'Imprima-Regular'),
                      ),
                    ),
                  ],
                ),
                ComponentButton(
                  text: "Login",
                  width: 20,
                  height: 6,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      int statusCode = await ApiService.login(
                        _userController.text,
                        _passwordController.text,
                      );

                      if (statusCode == 200) {
                        if (await ApiService.getProfileData()) {
                          sharedPreferences.saveTokenStatus();
                          Get.toNamed("/home");
                        }
                      } else {
                        Get.snackbar(
                          "Erro ao fazer login",
                          "Insira dados validos",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color.fromARGB(255, 138, 8, 8),
                          colorText: Colors.black,
                          borderRadius: 2,
                          duration: const Duration(milliseconds: 3000),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
