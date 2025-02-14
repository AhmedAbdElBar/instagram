import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class Buttonwidget extends StatelessWidget {
  late String text;
  late bool isEditeButton = false;
  late Color buttonColor;
  final VoidCallback chick;
  Buttonwidget({
    required this.text,
    required this.chick,
    required this.buttonColor,
    required this.isEditeButton,
  });
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
          style: isEditeButton
              ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              : TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
        ),
      ),
    );
  }
}
