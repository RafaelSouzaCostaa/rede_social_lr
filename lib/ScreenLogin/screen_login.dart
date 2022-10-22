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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0E1010),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/image/logo.png"),
              ),
              const SizedBox(height: 100),
              Form(
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
                      labelText: 'Senha', controller: password_controller),
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
                              onTap: () {
                                Navigator.pushNamed(context, '/cadastro');
                              },
                              child: Text(
                                "Cadastre-se",
                                style: TextStyle(color: Color(0xFF26F4E8)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
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
                          onTap: () {},
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF26F4E8),
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
    );
  }
}
