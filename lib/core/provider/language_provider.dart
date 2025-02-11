import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String _localeLanguage = "en"; // Default language

  String get localeLanguage => _localeLanguage;

  LanguageProvider() {
    _loadLanguage(); // Load the saved language when the provider is initialized
  }

  void changeLanguage(String lang) async {
    if (_localeLanguage != lang) {
      _localeLanguage = lang;
      notifyListeners();
      await _saveLanguage(lang); // Save the language to SharedPreferences
    }
  }

  Future<void> _saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', lang);
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _localeLanguage = prefs.getString('selected_language') ?? "en";
    notifyListeners(); // Notify listeners after loading the language
  }
}
