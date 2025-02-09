import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String localeLanguage = "en";
  void changeLanguage(String lang) {
    localeLanguage = lang;
    notifyListeners();
  }
}
