import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/settings/data/show_language_bottom_sheet.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/features/settings/presentation/widgets/settings_buttons.dart';

class SettingScreen extends StatelessWidget {
  static const String routname = "settings";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SettingsButtons(
              text: "language",
              icon: Icon(
                Icons.language,
              ),
              function: () {
                showLanguageBottomSheet(context);
              }),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark theme",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                )
              ],
            ),
          ),
          SettingsButtons(
              text: "Edite Profile",
              icon: Icon(
                Icons.edit,
              ),
              function: () =>
                  Navigator.pushNamed(context, EditProfile.routname)),
        ],
      ),
    );
  }
}
