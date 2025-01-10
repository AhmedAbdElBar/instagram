import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/widget/buttonWidget.dart';
import 'package:instagram/features/auth/presentation/widget/textField.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';

class LogIn extends StatefulWidget {
  static const String routname = 'LogIn';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  Future<void> login(BuildContext context) async {
    try {
      final email = emailController.text.trim(); //trim-->to remove spaces
      final password = passwordController.text.trim();
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter email and password.")),
        );
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Navigate to the home screen
      Navigator.pushReplacementNamed(context, HomeScreen.routname);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
  }

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
                  controller: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                Textfield(
                  text: "Password",
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(
                  text: "Login",
                  chick: ()=>login(context),
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
