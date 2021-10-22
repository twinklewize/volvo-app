import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: use_key_in_widget_constructors
class CarDetailsAppbar extends StatelessWidget {
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
            // back_arrow
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'assets/icons/back_arrow.svg',
                color: Colors.black,
                fit: BoxFit.none,
              ),
            ),

            SvgPicture.asset(
              'assets/icons/volvo_logo.svg',
              color: Colors.black,
              fit: BoxFit.none,
            ),

            // more
            SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(
                'assets/icons/more.svg',
                color: Colors.black,
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
