import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/settings/data/show_language_bottom_sheet.dart';
import 'package:instagram/features/settings/data/show_theme_bottom_sheet.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/features/settings/presentation/widgets/settings_buttons.dart';

class SettingScreen extends StatelessWidget {
  static const String routname = "settings";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                color: ThemingColor.blackFont,
              ),
              function: () {
                showLanguageBottomSheet(context);
              }),
          SettingsButtons(
              text: "Theme",
              icon: Icon(
                Icons.theater_comedy_rounded,
                color: ThemingColor.blackFont,
              ),
              function: () {
                showThemeBottomSheet(context);
              }),
          SettingsButtons(
              text: "Edite Profile",
              icon: Icon(
                Icons.edit,
                color: ThemingColor.blackFont,
              ),
              function: () =>
                  Navigator.pushNamed(context, EditProfile.routname)),
        ],
      ),
    );
  }
}
