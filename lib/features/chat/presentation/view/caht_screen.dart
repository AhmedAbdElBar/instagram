import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/chat/data/chat_data.dart';
import 'package:instagram/features/chat/presentation/widgets/message_input.dart';
import 'package:instagram/features/chat/presentation/widgets/message_widget.dart';
import 'package:instagram/features/home/presentation/view/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChatScreen extends StatefulWidget {
  static const String routname = "chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService chatService = ChatService();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routname);
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
        title: Text(AppLocalizations.of(context)!.chat),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: chatService.getMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text(AppLocalizations.of(context)!.noMessagesYet));
                }

                final messages = snapshot.data!.docs.reversed.toList();
                return ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final messageData = messages[index];
                    final messageText = messageData.get("content");
                    final messageSender = messageData.get("sender");
                    final isCurrentUser =
                        messageSender == chatService.currentUser?.email;

                    return MessageWidget(
                      message: messageText,
                      sender: messageSender,
                      isCurrentUser: isCurrentUser,
                    );
                  },
                );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
