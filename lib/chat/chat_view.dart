import 'package:flutter/material.dart';
import 'package:volvo_app/chat/components/message_bubble.dart';
import 'package:volvo_app/chat/components/new_message.dart';

// ignore: use_key_in_widget_constructors
class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MessageBubble(
            isMe: true,
            message: 'CHAT CHAT CHAT CHAT',
            userImage: 'assets/images/volvo_image_1.png',
            userName: 'Егор Чуриков',
          ),
          MessageBubble(
            isMe: false,
            message: 'CHAT CHAT CHAT CHAT',
            userImage: 'assets/images/volvo_image_1.png',
            userName: 'Егор Чуриков',
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
