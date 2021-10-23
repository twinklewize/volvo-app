import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  MessageBubble({
    required this.message,
    required this.userName,
    required this.userImage,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          !isMe
              ? CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                )
              : const SizedBox(),
          Bubble(
            margin: BubbleEdges.only(
              top: 24,
              right: 8,
              left: 8,
            ),
            padding: BubbleEdges.only(
              right: 16,
              left: 16,
              bottom: 16,
              top: isMe ? 16 : 12,
            ),
            radius: Radius.circular(12),
            nipRadius: 2,
            alignment: Alignment.bottomRight,
            nip: isMe ? BubbleNip.rightBottom : BubbleNip.leftBottom,
            color: isMe ? const Color(0xFF162870) : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMe
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          userName,
                          style: TextStyle(
                            color: Color(0xFF162870),
                            fontFamily: 'VolvoNovum',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontFamily: 'VolvoNovum',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          isMe
              ? CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
