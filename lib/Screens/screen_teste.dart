import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_open_input_button.dart';

import '../Colors/customized_colors_global.dart';
import '../Components/comp_app_bar.dart';
import '../Components/comp_drawer.dart';
import '../Components/comp_text_button.dart';
import '../Global/profile_authenticated.dart';

class Testes extends StatefulWidget {
  const Testes({super.key});

  @override
  State<Testes> createState() => _TestesState();
}

class _TestesState extends State<Testes> {
  ProfileAuthenticated profileAuthenticated = Get.put(ProfileAuthenticated());

  @override
  Widget build(BuildContext context) {
    String? urlImageProfile = profileAuthenticated.profileAuthentic.value.image;
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    //BUG
    TextEditingController _controllerName = TextEditingController(
        text: 'profileAuthenticated.profileAuthentic.value.name');
    TextEditingController _controllerNickname = TextEditingController();
    TextEditingController _controllerEmail = TextEditingController();
    TextEditingController _controllerpassword = TextEditingController();

    return SafeArea(
      child: Scaffold(
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    //Background image
                    color: Colors.yellow,
                    height: Get.height * 0.175,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Get.height * 0.11),
                    child: Center(
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3.2,
                            color: themeColor,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: urlImageProfile != null
                            ? CircleAvatar(
                                backgroundColor:
                                    CustomizedColors.blueBackground,
                                backgroundImage: NetworkImage(urlImageProfile))
                            : CircleAvatar(
                                backgroundColor:
                                    CustomizedColors.blueBackground,
                                backgroundImage: const ExactAssetImage(
                                    "assets/image/perfil.png"),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ComponentOpenInputButton(
                    text: "${'change'.tr} ${'name'.tr}",
                    icon: Icons.person,
                    subText: 'profileAuthenticated.profileAuthentic.value.name',
                    inputCotroller: _controllerName,
                    inputHintText:
                        'profileAuthenticated.profileAuthentic.value.name',
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentOpenInputButton(
                    icon: Icons.alternate_email,
                    text: "${'change'.tr} ${'nickname'.tr}",
                    subText:
                        "profileAuthenticated.profileAuthentic.value.nickname}",
                    inputCotroller: _controllerNickname,
                    inputHintText:
                        "profileAuthenticated.profileAuthentic.value.nickname}",
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentOpenInputButton(
                    icon: Icons.mail,
                    text: "${'change'.tr} Email",
                    subText:
                        'profileAuthenticated.profileAuthentic.value.email',
                    inputCotroller: _controllerEmail,
                    inputHintText:
                        'profileAuthenticated.profileAuthentic.value.email',
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    icon: Icons.key,
                    text: "${'change'.tr} ${'password'.tr}",
                    onPressed: () async {
                      await Get.toNamed("/login");
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ComponentTextButton(
                    text: 'logout'.tr,
                    icon: Icons.logout,
                    iconColor: Colors.red,
                    textColor: Colors.red,
                    onPressed: () async {
                      //apagar token
                      Get.offAllNamed('/login');
                    },
                  ),
                ],
              ),
              //input
            ],
          ),
        ),
      ),
    );
  }
}
