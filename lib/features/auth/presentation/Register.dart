import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/presentation/widget/buttonWidget.dart';
import 'package:instagram/features/auth/presentation/widget/textField.dart';

class Register extends StatelessWidget {
  static const String routname = "Register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemingColor.maincolor,
      ),
        backgroundColor: ThemingColor.maincolor,
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/image.png",
                  ),
                  width: 244,
                  height: 68,
                ),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Email"),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Password"),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Confirm Password"),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(text: "Sign up"),
              ],
            ),
          ),
        ));
  }
}
