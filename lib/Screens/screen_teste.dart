import 'package:flutter/material.dart';

import '../Colors/customized_colors_grobal.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    //Background image
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.075),
                    child: Center(
                      //ATENCAO modifiquei a ideia que tava daqui para baixo, botei uma borda ao inves de 2 circle avatar
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.2,
                                color: CustomizedColors.darkBackground),
                            borderRadius: BorderRadius.circular(60)),
                        child: CircleAvatar(
                          backgroundColor: CustomizedColors.linkInText,
                          backgroundImage:
                              const AssetImage("assets/image/perfil.png"),
                          //ATENCAO Imagem de Perfil (image == null ? : ,);
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 800,
                color: Colors.red,
              ),
              Container(
                height: 800,
                color: Colors.yellow,
              ),
              Container(
                height: 800,
                color: Colors.green,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
