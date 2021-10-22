import 'package:flutter/material.dart';
import 'package:volvo_app/car_details/car_details_view.dart';
import 'package:volvo_app/volvo/components/car_card.dart';
import 'package:volvo_app/volvo/components/image_cards.dart';
import 'package:volvo_app/volvo/components/search.dart';
import 'package:volvo_app/widgets/appbar.dart';

// ignore: use_key_in_widget_constructors
class VolvoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    //TODO MediaQuery
    //TODO model
    //TODO filters and search
    //посмотреть что не так с шрифтами
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CarProfileAppbar(),
          ),
          const SizedBox(height: 24),
          const ImageCards(),
          const SizedBox(height: 24),
          Search(),
          const SizedBox(height: 24),
          CarCard(
            title: 'VOLVO XC40 Recharge',
            information1: 'Кроссовер',
            information2: 'Полностью электрический',
            information3: '(РРЦ) MY22',
            price: '7,284,000',
            image: 'assets/images/car_card_image.png',
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CarDetailsView(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
