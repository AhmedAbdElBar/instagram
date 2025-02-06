import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/theme/theme_provider.dart';
import 'package:instagram/features/chat/data/chat_data.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final TextEditingController messageController = TextEditingController();
    final ChatService chatService = ChatService();

    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: themeProvider.themeMode == ThemeMode.dark
                ? ThemingColor.grayButtonColor
                : ThemingColor.darkGrayColor,
            width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write your message",
                hintStyle:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              if (messageController.text.isNotEmpty) {
                await chatService.sendMessage(messageController.text);
                messageController.clear();
              }
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
