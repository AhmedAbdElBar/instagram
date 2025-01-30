import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/data/login_data.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/auth/presentation/widget/customized_textField.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';

class LogIn extends StatefulWidget {
  static const String routname = 'LogIn';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {


  LoginData data = LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemingColor.maincolor,
        ),
        backgroundColor: ThemingColor.maincolor,
        body: Padding(
          padding: const EdgeInsets.all(15),
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
                  fontColor: ThemingColor.whiteFont,
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
                              color: Colors.black),
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
