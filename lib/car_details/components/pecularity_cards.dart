import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/car_details/car_details_view_model.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class Pecularities extends StatelessWidget {
  var pecularityData;

  @override
  Widget build(BuildContext context) {
    final carDetailsData = Provider.of<CarDetailsViewModel>(
      context,
      listen: false,
    );
    pecularityData = carDetailsData.pecularities;
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                PecularitiesCard(
                  title: pecularityData[0]['title'],
                  text: pecularityData[0]['text'],
                ),
                SizedBox(width: 8),
                PecularitiesCard(
                  title: pecularityData[1]['title'],
                  text: pecularityData[1]['text'],
                ),
                SizedBox(width: 8),
                PecularitiesCard(
                  title: pecularityData[2]['title'],
                  text: pecularityData[2]['text'],
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
