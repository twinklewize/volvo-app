import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhiteSlimContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const WhiteSlimContainer({
    required this.svgIconPath,
    required this.title,
    required this.isSelected,
  });

  final String svgIconPath;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 147,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFDDE7FF) : Colors.white,
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
            SvgPicture.asset(
              svgIconPath,
              color: isSelected ? Colors.black : Color.fromRGBO(69, 82, 91, 1),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color:
                    isSelected ? Colors.black : Color.fromRGBO(69, 82, 91, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
