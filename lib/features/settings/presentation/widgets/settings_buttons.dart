import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class SettingsButtons extends StatelessWidget {
  late String text;
  late Icon icon;
  late Function function;

  SettingsButtons(
      {required this.text, required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ThemingColor.lightGrayColor, width: 1)),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemingColor.blackFont),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
