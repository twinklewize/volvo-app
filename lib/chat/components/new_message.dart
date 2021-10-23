import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    // final user = FirebaseAuth.instance.currentUser;
    // final userData = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .get();
    // FirebaseFirestore.instance.collection('chat').add({
    //   'text': _enteredMessage,
    //   'createdAt': Timestamp.now(), //чтобы регулировать порядок сообщений
    //   'userId': user.uid,
    //   'username': userData['username'],
    //   'userImage': userData['imageUrl'],
    // });
    _controller.clear(); //очищаем текст
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 19),
            child: GestureDetector(
              onTap: _enteredMessage.trim().isEmpty ? null : _sendMessage,
              child: SvgPicture.asset('assets/icons/plus_icon.svg'),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(
                // vertical: 6,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Сообщение',
                  hintStyle: TextStyle(
                    fontFamily: 'VolvoNovum',
                    fontSize: 16,
                    color: Color(0xFF75777A),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _enteredMessage = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 19),
            child: GestureDetector(
              onTap: _enteredMessage.trim().isEmpty ? null : _sendMessage,
              child: SvgPicture.asset('assets/icons/send_icon.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
