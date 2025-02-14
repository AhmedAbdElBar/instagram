import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:instagram/features/profile_page/presentation/widgets/customizes_button_for_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  text: AppLocalizations.of(context)!.following,
                  chick: FollowCange,
                  buttonColor: ThemingColor.grayButtonColor,isEditeButton: false,
                )
              : Buttonwidget(
                  text: AppLocalizations.of(context)!.follow,
                  chick: FollowCange,
                  buttonColor: ThemingColor.blueButtonColor,isEditeButton: false,
                ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedButton(
                title: AppLocalizations.of(context)!.message,
              ),
              CustomizedButton(
                title: AppLocalizations.of(context)!.subscribe,
              ),
              CustomizedButton(
                title: AppLocalizations.of(context)!.contact,
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
