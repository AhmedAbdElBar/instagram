import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _localeLanguage = "en"; 

  String get localeLanguage => _localeLanguage; 

  void changeLanguage(String lang) {
    if (_localeLanguage != lang) {
      _localeLanguage = lang;
      notifyListeners(); 
    }
  }
}
