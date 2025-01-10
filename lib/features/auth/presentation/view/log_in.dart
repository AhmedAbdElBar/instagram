import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/widget/buttonWidget.dart';
import 'package:instagram/features/auth/presentation/widget/textField.dart';

class LogIn extends StatelessWidget {
  static const String routname = 'LogIn';

  const LogIn({super.key});
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
                Textfield(text: "Email"),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Password"),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(
                  text: "Login",
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do not have an email? ",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
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
