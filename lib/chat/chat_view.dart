import 'package:flutter/material.dart';
import 'package:volvo_app/car_details/components/car_details_appbar.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CarDetailsAppbar(
              haveBackArrow: false,
            ),
          ),
          Spacer(),
          MessageBubble(
            isMe: true,
            message: 'Слышали про новые акции от Вольво?',
            userImage: 'https://clck.ru/YQfru',
            userName: 'Егор Чуриков',
          ),
          MessageBubble(
            isMe: false,
            message: 'О дааа, уже пользуюсь, ужасно рад',
            userImage: 'https://clck.ru/YQfqn',
            userName: 'Егор Чуриков',
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
