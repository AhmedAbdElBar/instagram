import 'package:flutter/material.dart';

void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Language Settings"),
          ),
          body: Center(
            child: Column(
              children: [
                ListTile(
                  title: Text("English"),
                  onTap: () {
                    
                  },
                ),
                ListTile(
                  title: Text("العربية"),
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
