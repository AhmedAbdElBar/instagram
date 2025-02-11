import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instagram/core/provider/language_provider.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Language Settings"),
            ),
            body: Column(
              children: [
                ListTile(
                  title: Text("English"),
                  onTap: () {
                    languageProvider.changeLanguage("en");
                    Navigator.pop(context); 
                  },
                ),
                ListTile(
                  title: Text("العربية"),
                  onTap: () {
                    languageProvider.changeLanguage("ar");
                    Navigator.pop(context); 
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
