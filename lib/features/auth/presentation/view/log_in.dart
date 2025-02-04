import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/auth/data/login_data.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';

class LogIn extends StatefulWidget {
  static const String routname = 'LogIn';

  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LoginData data = LoginData();

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: themeProvider.themeMode == ThemeMode.dark
                      ? AssetImage("assets/images/instagram text logo2.png")
                      : AssetImage("assets/images/instagram text logo1.png"),
                  width: 244,
                  height: 68,
                ),
                SizedBox(
                  height: 20,
                ),
                Textfield(
                  text: "Email",
                  controller: data.emailController,
                  isPassword: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Textfield(
                  text: "Password",
                  controller: data.passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(
                  text: "Login",
                  chick: () => data.login(context),
                  buttonColor: ThemingColor.blueButtonColor,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do not have an email? ",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Register.routname);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ThemingColor.blueFontColor
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
