import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_textsub_button.dart';

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
    String numberfollowing = profileAuthenticated
        .profileAuthentic.value.getLengthFollowingObjectId
        .toString();
    String numberFollowers = profileAuthenticated
        .profileAuthentic.value.getLengthFollowersObjectId
        .toString();

    return SafeArea(
      child: Scaffold(
        drawer: const ComponentDrawer(),
        appBar: const ComponentAppBar(),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  //Background image
                  color: Colors.white,
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
                          color: CustomizedColors.darkBackground,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: urlImageProfile != null
                          ? CircleAvatar(
                              backgroundColor: CustomizedColors.blueBackground,
                              backgroundImage: NetworkImage(urlImageProfile))
                          : CircleAvatar(
                              backgroundColor: CustomizedColors.blueBackground,
                              backgroundImage: const ExactAssetImage(
                                  "assets/image/perfil.png"),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Text(
            //     'profileAuthenticated.profileAuthentic.value.name',
            //     style: const TextStyle(
            //       fontSize: 17,
            //       fontFamily: 'Imprima-Regular',
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(top: 5),
            //   child: Text(
            //     "@\${profileAuthenticated.profileAuthentic.value.nickname}",
            //     style: const TextStyle(
            //       color: Colors.grey,
            //       fontSize: 14,
            //       fontFamily: 'Imprima-Regular',
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: Text(
            //     //FIX mudar para description quando implementar
            //     profileAuthenticated.profileAuthentic.value.description
            //         .toString(),
            //     style: const TextStyle(
            //       color: Colors.grey,
            //       fontSize: 16,
            //       fontFamily: 'Imprima-Regular',
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            Column(
              children: [
                ComponentTextButtonWithSubtext(
                  text: "${'change'.tr} ${'name'.tr}",
                  icon: Icons.person,
                  subText: 'profileAuthenticated.profileAuthentic.value.name',
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ComponentTextButtonWithSubtext(
                  icon: Icons.alternate_email,
                  text: "${'change'.tr} ${'nickname'.tr}",
                  subText:
                      "@\${profileAuthenticated.profileAuthentic.value.nickname}",
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ComponentTextButtonWithSubtext(
                  icon: Icons.mail,
                  text: "${'change'.tr} Email",
                  subText: 'profileAuthenticated.profileAuthentic.value.email',
                  onPressed: () async {
                    await Get.toNamed("/login");
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                ComponentTextButtonWithSubtext(
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
          ],
        ),
      ),
    );
  }
}
