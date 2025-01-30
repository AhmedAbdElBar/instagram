import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/data/register_data.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';

class Register extends StatelessWidget {
  static const String routname = "Register";
  RegisterData data = RegisterData();
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
                // Email Field
                Textfield(
                  text: "Email",
                  controller: data.emailController,
                  isPassword: false,
                ),
                SizedBox(
                  height: 20,
                ),
                // Username Field
                Textfield(
                  text: "Username",
                  controller: data.usernameController,
                  isPassword: false,
                ),
                SizedBox(
                  height: 20,
                ),
                // Password Field
                Textfield(
                  text: "Password",
                  controller: data.passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                // Confirm Password
                Textfield(
                  text: "Confirm Password",
                  controller: data.confirmPasswordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(
                  text: "Sign up",
                  chick: () => data.signUp(context),
                  buttonColor: ThemingColor.blueButtonColor,
                  fontColor: ThemingColor.whiteFont,
                ),
              ],
            ),
          ),
        ));
  }
}
