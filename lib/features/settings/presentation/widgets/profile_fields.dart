import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const ProfileField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100, // Fixed width for labels
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          height: 50,
          width: 0.5,
          color: ThemingColor.lightGrayColor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
            ),
          ),
        ),
      ],
    );
  }
}
