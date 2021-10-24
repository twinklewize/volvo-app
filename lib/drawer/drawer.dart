import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/auth/auth_view.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    String title,
    Function()? tapHandler,
  ) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: (title == 'Выход') ? Colors.red : Colors.black,
          ),
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(height: 60),
          Container(
            width: 165,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset('assets/icons/volvo_logo.svg'),
          ),
          const SizedBox(height: 20),
          buildListTile(
            'Поиск дилера',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Вызвать эвакуатор',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Тест-драйв',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Трейд-ин',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Новости',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Техподдержка',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Выход',
            () {
              Provider.of<UserProfileViewModel>(context, listen: false)
                  .user
                  .phone = '';
              Provider.of<UserProfileViewModel>(context, listen: false)
                  .user
                  .password = '';
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthView(),
                ),
              );
            },
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/icons/facebook.svg'),
              SvgPicture.asset('assets/icons/instagram.svg'),
              SvgPicture.asset('assets/icons/ok.svg'),
              SvgPicture.asset('assets/icons/telegram.svg'),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
