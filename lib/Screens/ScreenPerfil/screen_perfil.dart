import 'package:flutter/material.dart';

import '../../Colors/customized_colors_grobal.dart';
import '../../Components/comp_appBar.dart';
import '../../Components/comp_tab.dart';

class ScreenPerfil extends StatefulWidget {
  const ScreenPerfil({Key? key}) : super(key: key);

  @override
  State<ScreenPerfil> createState() => _ScreenPerfilState();
}

class _ScreenPerfilState extends State<ScreenPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComponentAppBar(hasDrawer: false),
      backgroundColor: CustomizedColors.darkBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  //Background image
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.14,
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
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(children: [
                    const Center(
                      child: Text(
                        "Nome do Usuario", //NomePerfil
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Imprima-Regular',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          "@nickname", //NomePerfil
                          style: TextStyle(
                            color: CustomizedColors.linkInText,
                            fontSize: 14,
                            fontFamily: 'Imprima-Regular',
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                ComponentTab(
                  height: 0.56,
                  width: 1,
                  indicatorColor: CustomizedColors.blueBackground,
                  labelColor: CustomizedColors.blueBackground,
                  unselectedLabelColor: CustomizedColors.lightText,
                  tabsName: const [
                    Text("Postagens"),
                    Text("Curtidas"),
                  ],
                  tabs: [
                    Tab(
                      child: Container(color: Colors.transparent),
                    ),
                    Tab(
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
