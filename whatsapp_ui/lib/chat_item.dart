import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_ui/chat_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
    required this.chatModel,
    required this.extraHours,
  }) : super(key: key);

  final ChatModel chatModel;
  final int extraHours;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          chatModel.imgURL,
        ),
      ),
      trailing: Text(
        DateFormat.jm().format(
          DateTime.now().add(
            Duration(
              hours: extraHours,
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chatModel.name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            //chatList[index].intialMessage,
            chatModel.intialMessage,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}
