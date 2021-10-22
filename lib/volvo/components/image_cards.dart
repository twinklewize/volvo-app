import 'package:flutter/material.dart';

class ImageCards extends StatelessWidget {
  const ImageCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            ImageCard(
              image: 'assets/images/image_card_1.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_2.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_3.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_4.png',
              press: () {},
            ),
            const SizedBox(width: 8),
            ImageCard(
              image: 'assets/images/image_card_5.png',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors

  final String image;
  final Function press;

  // ignore: use_key_in_widget_constructors
  const ImageCard({
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(image),
      ),
    );
  }
}
