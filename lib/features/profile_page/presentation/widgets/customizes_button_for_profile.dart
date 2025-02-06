import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';

class CustomizedButton extends StatelessWidget {
  late String title;
  CustomizedButton({required this.title});
  @override
  Widget build(BuildContext context) {
    final themeProvider=ThemeProvider.of(context);
    return InkWell(
      child: Container(
                decoration: BoxDecoration(
                  color: themeProvider.themeMode == ThemeMode.dark
                  ? ThemingColor.darkGrayColor
                  : ThemingColor.grayButtonColor,
                  borderRadius: BorderRadius.circular(5)
                ),
                height: 30,
                width: 106,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold)),
              ),
    );
  }
}
