import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class CustomizedButtonWithIcon extends StatelessWidget {
  late Widget icon;
  CustomizedButtonWithIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(left: 5, right: 5),
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
        ),
        child: icon,
      ),
    );
  }
}
