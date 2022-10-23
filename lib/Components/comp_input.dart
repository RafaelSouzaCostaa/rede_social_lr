// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rede_social_lr/Colors/customized_colors_grobal.dart';

import '../Colors/pattern_colors.dart';

class ComponentInput extends StatefulWidget {
  String labelText;
  var suffixIcon;
  bool obscureText = false;
  bool validator = false;
  TextEditingController controller;

  ComponentInput({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator = false,
    required this.controller,
  });

  @override
  State<ComponentInput> createState() => _ComponentInputState();
}

class _ComponentInputState extends State<ComponentInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 65,
      child: TextFormField(
        style: TextStyle(color: Colors.white70, fontFamily: 'Imprima-Regular'),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffix: widget.suffixIcon,
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 13, color: Colors.white70),
          hintStyle: TextStyle(fontSize: 13, color: Colors.white24),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 0.45,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: CustomizedColors.inputBorderColor,
              width: 1.2,
            ),
          ),
        ),
        validator: widget.validator == true
            ? (value) {
                if (value!.isEmpty) {
                  return "Campo Obrigatorio";
                }
              }
            : null,
      ),
    );
  }
}
