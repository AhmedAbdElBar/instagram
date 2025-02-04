import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  final bool isCurrentUser;

  const MessageWidget({
    required this.message,
    required this.sender,
    required this.isCurrentUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color:
              isCurrentUser ? ThemingColor.blueButtonColor : Colors.grey[300],
          borderRadius: isCurrentUser? BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)):BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isCurrentUser?ThemingColor.whiteFont:ThemingColor.blackFont,
              ),
            ),
            SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                  fontSize: 16,
                  color: isCurrentUser ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
