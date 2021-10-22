import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhiteSlimContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const WhiteSlimContainer({
    required this.svgIconPath,
    required this.title,
  });

  final String svgIconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 147,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            spreadRadius: 4,
            blurRadius: 18,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgIconPath),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(69, 82, 91, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
