import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/settings/presentation/widgets/edit_profile.dart';

class EditeAndOtherButtons extends StatefulWidget {
  const EditeAndOtherButtons({super.key});

  @override
  State<EditeAndOtherButtons> createState() => _EditeAndOtherButtonsState();
}

class _EditeAndOtherButtonsState extends State<EditeAndOtherButtons> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Buttonwidget(
              text: "Edit",
              chick: () {
                Navigator.pushNamed(context, EditProfile.routname);
              },
              buttonColor: themeProvider.themeMode == ThemeMode.dark
                  ? ThemingColor.darkGrayColor
                  : ThemingColor.grayButtonColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? ThemingColor.darkGrayColor
                      : ThemingColor.grayButtonColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.person_add_alt_outlined,
              ),
            ),
          )
        ],
      ),
    );
  }
}
