import 'package:flutter/material.dart';

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Theme Settings"),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text("Light Theme"),
                onTap: () {
                  // Handle theme selection here
                },
              ),
              ListTile(
                title: Text("Dark Theme"),
                onTap: () {
                  // Handle theme selection here
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
