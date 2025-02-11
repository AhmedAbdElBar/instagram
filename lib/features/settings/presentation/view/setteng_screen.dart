import 'package:flutter/material.dart';
import 'package:instagram/core/provider/language_provider.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/settings/data/show_language_bottom_sheet.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/features/settings/presentation/widgets/settings_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingScreen extends StatelessWidget {
  static const String routname = "settings";


  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final languageProvider = LanguageProvider();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SettingsButtons(
              text: AppLocalizations.of(context)!.languages,
              icon: Icon(
                Icons.language,
              ),
              function: () {
                showLanguageBottomSheet(context);
              }),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: ThemingColor.lightGrayColor, width: 1)),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.darkTheme,
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
              text: AppLocalizations.of(context)!.editProfile,
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
