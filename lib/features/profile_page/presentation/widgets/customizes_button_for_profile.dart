import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class CustomizedButton extends StatelessWidget {
  late String title;
  late Color fontColor;
  CustomizedButton({required this.title, required this.fontColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
                decoration: BoxDecoration(
                  color: ThemingColor.grayButtonColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                width: 106,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: fontColor,
                        fontWeight: FontWeight.bold)),
              ),
    );
  }
}
