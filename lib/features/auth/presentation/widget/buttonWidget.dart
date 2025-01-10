import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class Buttonwidget extends StatelessWidget {
  late String text;
  Buttonwidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 400,
        decoration: BoxDecoration(
            color: ThemingColor.blueFontColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              color: ThemingColor.whiteFont,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
