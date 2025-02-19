import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData) {
          return HomeScreen(); 
        }
        return LogIn(); 
      },
    );
  }
}