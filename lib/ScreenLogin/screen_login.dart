// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rede_social_lr/Components/comp_input.dart';
import 'package:rede_social_lr/ScreenCadastro/screen_cadastro.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController user_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0E1010),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/image/logo.png"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Form(
                  //user
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ComponentInput(
                        labelText: 'Usuario',
                        controller: user_controller,
                        validator: true,
                      ),
                    ),
                    ComponentInput(
                      //Senha
                      obscureText: !_visiblePassword,
                      labelText: 'Senha',
                      controller: password_controller,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: _visiblePassword
                            ? Icon(Icons.visibility_sharp)
                            : Icon(Icons.visibility_off_sharp),
                        color: Colors.white70,
                        style: ButtonStyle(),
                        onPressed: () {
                          setState(() {
                            _visiblePassword = !_visiblePassword;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Não tem uma conta? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Cadastre-se",
                                  style: TextStyle(color: Color(0xFF26F4E8)),
                                ),
                                onTap: () {
                                  //TODO > Navigator para pagina de cadastro
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: EdgeInsets.only(left: 35),
                          child: GestureDetector(
                            child: Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(color: Color(0xFF26F4E8)),
                            ),
                            onTap: () {
                              //TODO > Navigator para pagina de trocar senha
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF26F4E8),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
