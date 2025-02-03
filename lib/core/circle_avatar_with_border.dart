import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';

class CircleavatarWithBorder extends StatelessWidget {
  late String image;
  late int withBorder = 1;
  late double size;
  CircleavatarWithBorder(this.withBorder,
      {super.key, required this.size, required this.image});
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: withBorder == 1
            ? const LinearGradient(
                colors: [
                  Color(0xFFF58529),
                  Color(0xFFDD2A7B),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: themeProvider.themeMode == ThemeMode.dark
                ? ThemingColor.blackFont
                : ThemingColor.maincolor,
            shape: BoxShape.circle),
        child: CircleAvatar(
          radius: size,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
