import 'package:flutter/material.dart';

class ThemingColor extends StatefulWidget {
  static Color blueButtonColor = Color.fromRGBO(0, 163, 255, 1);
  static Color grayButtonColor = Color.fromRGBO(239, 239, 239, 1);
  static Color iconsColors = Colors.black;
  static Color darkGrayColor = Color.fromRGBO(38, 38, 38, 1);
  static Color lightGrayColor = Color.fromRGBO(217, 217, 217, 1);
  static Color blueFontColor = Color.fromRGBO(56, 151, 240, 1);
  static Color maincolor = Color.fromRGBO(255, 255, 255, 1);
  static Color whiteFont = maincolor;
  static Color blackFont = darkGrayColor;

  @override
  State<ThemingColor> createState() => _ThemingColorState();
}

class _ThemingColorState extends State<ThemingColor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
