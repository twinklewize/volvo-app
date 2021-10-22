import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class Pecularities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: const [
                PecularitiesCard(
                  title: '420 км',
                  text: 'Запас хода на электрической тяге',
                ),
                SizedBox(width: 8),
                PecularitiesCard(
                  title: '4.7 секунд',
                  text: 'Разгон с 0 до 100 км/час',
                ),
                SizedBox(width: 8),
                PecularitiesCard(
                  title: '100%',
                  text: 'Без использования натуральной кожи',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PecularitiesCard extends StatelessWidget {
  final String title;
  final String text;

  // ignore: use_key_in_widget_constructors
  const PecularitiesCard({
    required this.title,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 150,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.cardTitle),
          const SizedBox(height: 6),
          Text(text, style: TextStyles.cardText),
        ],
      ),
    );
  }
}
