import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/provider/language_provider.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/auth/presentation/view/log_in.dart';
import 'package:instagram/features/settings/data/show_language_bottom_sheet.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';
import 'package:instagram/features/settings/presentation/widgets/settings_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  static const String routname = "settings";

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          // Change language button
          SettingsButtons(
              text: AppLocalizations.of(context)!.languages,
              icon: Icon(
                Icons.language,
              ),
              function: () {
                showLanguageBottomSheet(context);
              }),
          // Change theme button
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
          // Edit profile button
          SettingsButtons(
              text: AppLocalizations.of(context)!.editProfile,
              icon: Icon(
                Icons.edit,
              ),
              function: () =>
                  Navigator.pushNamed(context, EditProfile.routname)),
          // Logout button with confirm logout
          SettingsButtons(
              text: AppLocalizations.of(context)!.logout,
              icon: Icon(
                Icons.logout,
              ),
              function: () => _confirmLogout(context))
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ThemingColor.darkGrayColor,
          title: Text(AppLocalizations.of(context)!.logout),
          content: Text(AppLocalizations.of(context)!.logoutConfirmation),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                )),
            TextButton(
              onPressed: () => logout(),
              child: Text(AppLocalizations.of(context)!.logout,
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, LogIn.routname);
  }
}
