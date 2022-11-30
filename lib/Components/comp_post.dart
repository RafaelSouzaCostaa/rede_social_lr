// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rede_social_lr/Components/comp_text.dart';

import '../Colors/customized_colors_global.dart';

class ComponentPost extends StatefulWidget {
  // String perfilImage;
  List<String>? postImage = List<String>.empty(growable: true);
  String? postDescription;
  String? postUsername;
  String? postNickname;
  int? numberOfLikes;
  int? numberOfReposts;
  int? numberOfComments;

  ComponentPost({
    super.key,
    required this.postDescription,
    required this.postUsername,
    required this.postNickname,
    this.numberOfLikes,
    this.numberOfReposts,
    this.numberOfComments,
    this.postImage,
  });

  @override
  State<ComponentPost> createState() => _ComponentPostState();
}

class _ComponentPostState extends State<ComponentPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 1.0,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: CustomizedColors.blueBackground,
                  //IMPLEMENTAR trocar foto pelo do perfil quando implementar
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 15,
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  //Nome Nickname e opções
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ComponentText(
                            text: widget.postUsername,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ComponentText(
                              text: widget.postNickname, color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          //Uma imagem
          Container(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.postImage?.length == 1
                    ? Container(
                        color: Colors.pink,
                        width: Get.width * 0.75,
                        height: 300,
                      )
                    : Container(),
                //Duas imagens
                widget.postImage?.length == 2
                    ? Row(
                        children: [
                          Container(
                            color: Colors.green,
                            width: Get.width * 0.38,
                            height: 300,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.blue,
                            width: Get.width * 0.38,
                            height: 300,
                          )
                        ],
                      )
                    : Container(),
                //Três imagens
                //LUIGGI FAZER 3 e 4
                widget.postImage?.length == 3
                    ? Container(
                        color: Colors.pink,
                        width: Get.width * 0.8,
                        height: 300,
                      )
                    : Container(),
                //Quatro imagens
                widget.postImage?.length == 4
                    ? Container(
                        color: Colors.pink,
                        width: Get.width * 0.8,
                        height: 300,
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
