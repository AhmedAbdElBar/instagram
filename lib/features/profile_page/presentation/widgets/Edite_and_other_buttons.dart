import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/core/customized_button_widget.dart';
import 'package:instagram/features/profile_page/presentation/widgets/customizes_button_for_profile.dart';

class EditeAndOtherButtons extends StatefulWidget {
  const EditeAndOtherButtons({super.key});

  @override
  State<EditeAndOtherButtons> createState() => _EditeAndOtherButtonsState();
}

class _EditeAndOtherButtonsState extends State<EditeAndOtherButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Buttonwidget(
              text: "Edit",
              chick: () {},
              buttonColor: ThemingColor.grayButtonColor,
              fontColor: ThemingColor.blackFont,
            ),
          ),
          SizedBox(width: 10,),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ThemingColor.grayButtonColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.person_add_outlined),
            ),
          )
        ],
      ),
    );
  }
}
