import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle cardTitleText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    fontFamily: 'VolvoNovum',
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.white,
    fontFamily: 'VolvoNovum',
  );

  static const TextStyle priceText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: 'VolvoNovum',
  );

  static const TextStyle informationText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color(0xFF8495A3),
    fontFamily: 'VolvoNovum',
  );

  static const TextStyle hintText = TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xFF71767a),
    fontFamily: 'VolvoNovum',
    fontSize: 16,
  );
}

class ContainerStyles {
  static const List<BoxShadow> shadowStyle = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      spreadRadius: 4,
      blurRadius: 18,
      offset: Offset(0, 2), // changes position of shadow
    ),
  ];
}
