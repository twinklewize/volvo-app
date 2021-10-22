import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ColorDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorDot(color: 0xFF31679F, press: () {}),
        const SizedBox(width: 16),
        ColorDot(color: 0xFFD9D9D6, press: () {}),
        const SizedBox(width: 16),
        ColorDot(color: 0xFFC5C9CA, press: () {}),
        const SizedBox(width: 16),
        ColorDot(color: 0xFF899087, press: () {}),
        const SizedBox(width: 16),
        ColorDot(color: 0xFF595F66, press: () {}),
        const SizedBox(width: 16),
        ColorDot(color: 0xFF101820, press: () {}),
        const SizedBox(width: 16),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFBC3D3A)),
          ),
          child: Center(child: ColorDot(color: 0xFFBC3D3A, press: () {})),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final int color;
  final Function() press;

  const ColorDot({
    required this.color,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(color),
        ),
      ),
    );
  }
}
