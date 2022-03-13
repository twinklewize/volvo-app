import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/car_details/car_details_view_model.dart';

// ignore: use_key_in_widget_constructors
class ColorDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carDetailsData = Provider.of<CarDetailsViewModel>(
      context,
      listen: false,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorDot(
            isSelected: carDetailsData.colorIndex == 0 ? true : false,
            color: 0xFF31679F,
            press: () {
              carDetailsData.setColorIndex(0);
            }),
        const SizedBox(width: 16),
        ColorDot(
            isSelected: carDetailsData.colorIndex == 1 ? true : false,
            color: 0xFFD9D9D6,
            press: () {
              carDetailsData.setColorIndex(1);
            }),
        const SizedBox(width: 16),
        ColorDot(
            isSelected: carDetailsData.colorIndex == 2 ? true : false,
            color: 0xFFC5C9CA,
            press: () {
              carDetailsData.setColorIndex(2);
            }),
        const SizedBox(width: 16),
        ColorDot(
            isSelected: carDetailsData.colorIndex == 3 ? true : false,
            color: 0xFF899087,
            press: () {
              carDetailsData.setColorIndex(3);
            }),
        const SizedBox(width: 16),
        ColorDot(
            isSelected: carDetailsData.colorIndex == 4 ? true : false,
            color: 0xFF595F66,
            press: () {
              carDetailsData.setColorIndex(4);
            }),
        const SizedBox(width: 16),
        ColorDot(
            isSelected: carDetailsData.colorIndex == 5 ? true : false,
            color: 0xFF101820,
            press: () {
              carDetailsData.setColorIndex(5);
            }),
        const SizedBox(width: 16),
        ColorDot(
          isSelected: carDetailsData.colorIndex == 6 ? true : false,
          color: 0xFFBC3D3A,
          press: () {
            carDetailsData.setColorIndex(6);
          },
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final bool isSelected;
  final int color;
  final Function() press;

  // ignore: use_key_in_widget_constructors
  ColorDot({
    required this.color,
    required this.press,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border:
            Border.all(color: isSelected ? Color(color) : Colors.transparent),
      ),
      child: Center(
        child: GestureDetector(
          onTap: press,
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(color),
            ),
          ),
        ),
      ),
    );
  }
}
