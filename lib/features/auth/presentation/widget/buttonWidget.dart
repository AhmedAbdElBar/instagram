import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class Buttonwidget extends StatelessWidget {
  late String text;
  final VoidCallback chick;
  Buttonwidget({super.key, required this.text, required this.chick});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(//we want to custmized the buttons like the UI
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        elevation: 5,
      ),
      onPressed: chick,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
