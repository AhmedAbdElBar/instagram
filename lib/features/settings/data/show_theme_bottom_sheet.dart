import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.themeSettings),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.lightTheme),
                onTap: () {
                  // Handle theme selection here
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.darkTheme),
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
