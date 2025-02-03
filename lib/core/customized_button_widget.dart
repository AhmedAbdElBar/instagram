import 'package:flutter/material.dart';

class Buttonwidget extends StatelessWidget {
  late String text;
  late Color buttonColor;
  final VoidCallback chick;
  late Color fontColor;
  Buttonwidget(
      {super.key,
      required this.text,
      required this.chick,
      required this.buttonColor,
      required this.fontColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: chick,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: fontColor),
        ),
      ),
    );
  }
}
