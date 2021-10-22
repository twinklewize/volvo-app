import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/user_profile/components/card.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

// ignore: use_key_in_widget_constructors
class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProfileViewModel>(context).user;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 44),
          // appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 36,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // back button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/icons/back_button.svg'),
                  ),
                  // show more actions
                  GestureDetector(
                    onTap: () {
                      print('show more actions');
                    },
                    child: SvgPicture.asset(
                        'assets/icons/horizontal_more_button.svg'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // hello user and photo
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 48,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // hello, user
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Добро пожаловать,',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(132, 140, 144, 1),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.name + ' ' + user.surname,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // avatar
                  GestureDetector(
                    onTap: () {
                      print('change photo');
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.avatarURI),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PrivelegeClubCardView(),
        ],
      ),
    ));
  }
}
