import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
      primaryColor: Color.fromRGBO(0, 163, 255, 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(0, 163, 255, 1),
          foregroundColor: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            Color.fromRGBO(255, 255, 255, 1), 
        selectedItemColor: Colors.black, 
        unselectedItemColor: ThemingColor.darkGrayColor, 
        elevation: 5, 
      ));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
      primaryColor: Color.fromRGBO(0, 163, 255, 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(0, 163, 255, 1),
          foregroundColor: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1), 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.grey, 
        elevation: 5, 
      ),
      );
}
