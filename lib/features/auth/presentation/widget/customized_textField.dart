import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class Textfield extends StatelessWidget {
  late String text;
  bool isPassword = false;

  final TextEditingController controller;
  Textfield({required this.text, required this.controller,required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
