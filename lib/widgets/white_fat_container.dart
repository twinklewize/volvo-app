import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volvo_app/main.dart';

// ignore: must_be_immutable
class WhiteFatContainer extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  WhiteFatContainer({
    required this.title,
    required this.svgIconPath,
    required this.number,
  });

  final String title;
  final String svgIconPath;
  int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          // чуть больше места для бейджа
          const SizedBox(height: 91, width: 135),
          // белый контейнер
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              height: 80,
              width: 129,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(svgIconPath),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // бейдж
          number != 0
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    backgroundColor: VolvoColors.firstColor,
                    radius: 12,
                    child: Text(
                      '$number',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
