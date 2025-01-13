import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class Buttonwidget extends StatelessWidget {
  late String text;
  final VoidCallback chick;
  Buttonwidget({super.key, required this.text, required this.chick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: chick,
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ThemingColor.blueFontColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, 
          fontWeight: FontWeight.bold,
          color: ThemingColor.whiteFont),
        ),
      ),
    );
  }
}
