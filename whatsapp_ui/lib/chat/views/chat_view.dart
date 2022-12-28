import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chat/widgets/chat_item.dart';
import 'package:whatsapp_ui/chat/models/chat_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ChatItem(
            chatModel: chatList[index],
            extraHours: index,
          );
        },
        itemCount: chatList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
