import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';

class LoginData{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
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

      UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      // Navigate to the home screen
      Navigator.pushReplacementNamed(context, HomeScreen.routname);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
  }
}