import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/view/Register.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';
import 'package:instagram/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LogIn.routname: (context) => LogIn(),
        Register.routname: (context) => Register(),
        HomeScreen.routname: (context) => HomeScreen()
      },
      initialRoute: HomeScreen.routname,
    );
  }
}
