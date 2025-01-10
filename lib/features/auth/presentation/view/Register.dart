import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/auth/presentation/widget/buttonWidget.dart';
import 'package:instagram/features/auth/presentation/widget/textField.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';

class Register extends StatelessWidget {
  static const String routname = "Register";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill in all fields.")),
        );
        return;
      }

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match.")),
        );
        return;
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the home screen or another screen
      Navigator.pushReplacementNamed(context, HomeScreen.routname);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Sign-up failed")),
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
                Textfield(text: "Email",controller: emailController,),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Password",controller: passwordController,),
                SizedBox(
                  height: 20,
                ),
                Textfield(text: "Confirm Password",controller: confirmPasswordController,),
                SizedBox(
                  height: 20,
                ),
                Buttonwidget(text: "Sign up", chick:()=> signUp(context)),
              ],
            ),
          ),
        ));
  }
}
