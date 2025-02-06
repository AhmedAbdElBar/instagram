import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/auth/data/register_data.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';

class Register extends StatelessWidget {
  static const String routname = "Register";
  RegisterData data = RegisterData();
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 244,
                  height: 68,
                  child: Image(
                    image: themeProvider.themeMode == ThemeMode.dark
                        ? AssetImage("assets/images/image2.png")
                        : AssetImage("assets/images/image1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Email Field
                Textfield(
                  text: "Email",
                  controller: data.emailController,
                  isPassword: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Username Field
                Textfield(
                  text: "Username",
                  controller: data.usernameController,
                  isPassword: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Password Field
                Textfield(
                  text: "Password",
                  controller: data.passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Confirm Password
                Textfield(
                  text: "Confirm Password",
                  controller: data.confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Buttonwidget(
                  text: "Sign up",
                  chick: () => data.signUp(context),
                  buttonColor: ThemingColor.blueButtonColor,
                ),
              ],
            ),
          ),
        ));
  }
}
