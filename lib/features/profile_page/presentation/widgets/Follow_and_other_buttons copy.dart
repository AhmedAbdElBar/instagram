import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/profile_page/presentation/widgets/customizes_button_for_profile.dart';

class FollowAndOtherButtons extends StatefulWidget {
  const FollowAndOtherButtons({super.key});

  @override
  State<FollowAndOtherButtons> createState() => _FollowAndOtherButtonsState();
}

class _FollowAndOtherButtonsState extends State<FollowAndOtherButtons> {
  bool isFollowed = false;
  void FollowCange() {
    setState(() {
      isFollowed = !isFollowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Container(
      child: Column(
        children: [
          isFollowed
              ? Buttonwidget(
                  text: "Following",
                  chick: FollowCange,
                  buttonColor: ThemingColor.grayButtonColor,
                )
              : Buttonwidget(
                  text: "Follow",
                  chick: FollowCange,
                  buttonColor: ThemingColor.blueButtonColor,
                ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedButton(
                title: "Messeage",
              ),
              CustomizedButton(
                title: "Supscripe",
              ),
              CustomizedButton(
                title: "Contact",
              ),
              Container(
                decoration: BoxDecoration(
                    color: themeProvider.themeMode == ThemeMode.dark
                        ? ThemingColor.darkGrayColor
                        : ThemingColor.grayButtonColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 30,
                width: 32,
                alignment: Alignment.center,
                child: Icon(Icons.person_add_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
