import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class Textfield extends StatelessWidget {
  late String text;
  final TextEditingController controller;
  Textfield({required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400
          ),
          fillColor: ThemingColor.lightGrayColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
