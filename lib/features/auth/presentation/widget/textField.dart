import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class Textfield extends StatelessWidget {
  late String text;
  Textfield({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
          ),
          fillColor: ThemingColor.lightGrayColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
