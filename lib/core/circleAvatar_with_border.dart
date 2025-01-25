import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class CircleavatarWithBorder extends StatelessWidget {
  late int chick = 1;
  late String image;
  late double size;
  CircleavatarWithBorder({required this.chick,required this.size, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: chick != 1
            ? LinearGradient(
                colors: [
                  Color(0xFFF58529),
                  Color(0xFFDD2A7B),
                  Color(0xFF8134AF),
                  Color(0xFF515BD4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: ThemingColor.maincolor, shape: BoxShape.circle),
        child: CircleAvatar(
          radius: size,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
