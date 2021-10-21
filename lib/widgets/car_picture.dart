import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarPicture extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CarPicture({
    required this.imageURI,
  });

  final String imageURI;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 36,
          right: 36,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: SvgPicture.asset(
              'assets/images/undercar_ellipse.svg',
              width: MediaQuery.of(context).size.width - 72,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width / 2 - 40,
          right: MediaQuery.of(context).size.width / 2 - 40,
          child: SvgPicture.asset(
            'assets/images/undercar_button.svg',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: Image.asset(imageURI),
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
