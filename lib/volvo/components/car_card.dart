import 'package:flutter/material.dart';
import 'package:volvo_app/volvo/components/constants.dart';

// ignore: use_key_in_widget_constructors
class CarCard extends StatelessWidget {
  final String title;
  final String information1;
  final String information2;
  final String information3;
  final String image;
  final String price;
  final Function() press;

  const CarCard({
    Key? key,
    required this.title,
    required this.information1,
    required this.information2,
    required this.information3,
    required this.press,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: size.width - 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: ContainerStyles.shadowStyle,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 16,
                left: 16,
                bottom: 40,
              ),
              child: Image.asset(image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Text(title, style: TextStyles.cardTitleText),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(information1, style: TextStyles.informationText),
                      const Text('   ·   ', style: TextStyles.informationText),
                      Text(information2, style: TextStyles.informationText),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'От $price руб. $information3',
              style: TextStyles.priceText,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 18,
                bottom: 24,
              ),
              child: GestureDetector(
                onTap: press,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF162870),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Подробнее',
                      style: TextStyles.buttonText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
