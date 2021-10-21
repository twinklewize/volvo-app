import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarModel extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CarModel({
    required this.model,
  });

  final String model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          model,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset('assets/icons/warning.svg'),
      ],
    );
  }
}
