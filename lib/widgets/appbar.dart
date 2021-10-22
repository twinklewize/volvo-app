// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: use_key_in_widget_constructors
class CarProfileAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // burger
            SvgPicture.asset(
              'assets/icons/drawer.svg',
              color: Colors.black,
              fit: BoxFit.none,
            ),

            // avatar
            Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://clck.ru/YMFMM'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
