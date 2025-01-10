import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        LogIn.routname:(context)=>LogIn(),
        Register.routname:(context)=>Register(),
      },
      initialRoute:LogIn.routname,
    );
  }
}