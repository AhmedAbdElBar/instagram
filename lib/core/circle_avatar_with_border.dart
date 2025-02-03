import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class CircleavatarWithBorder extends StatelessWidget {
  late String image;
  late int withBorder=1;
  late double size;
  CircleavatarWithBorder(this.withBorder,{super.key, required this.size, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient:withBorder==1? const LinearGradient(
          colors: [
            Color(0xFFF58529),
            Color(0xFFDD2A7B),
            Color(0xFF8134AF),
            Color(0xFF515BD4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ):null,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding:const EdgeInsets.all(2),
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
