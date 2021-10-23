// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/car_details/car_details_view_model.dart';
import 'package:volvo_app/car_details/components/car_details_appbar.dart';
import 'package:volvo_app/car_details/components/color_dots.dart';
import 'package:volvo_app/car_details/components/pecularity_cards.dart';
import 'package:volvo_app/car_details/components/preorder_btn_and_flag.dart';
import 'package:volvo_app/widgets/car_picture.dart';

import 'components/constants.dart';

class CarDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carDetailsData = Provider.of<CarDetailsViewModel>(
      context,
      listen: true,
    );
    var colorImages = carDetailsData.colorImages;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: CarDetailsAppbar(),
                ),
                const SizedBox(height: 28),

                //цвета
                ColorDots(),
                const SizedBox(height: 48),

                //картинка с машиной
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CarPicture(
                      imageURI: colorImages[carDetailsData.colorIndex]),
                ),
                const SizedBox(height: 24),

                //Особенности
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text('Особенности', style: TextStyles.title),
                ),
                const SizedBox(height: 16),
                Pecularities(),
                const SizedBox(height: 32),

                //Текст
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(carDetailsData.title, style: TextStyles.title),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(carDetailsData.text, style: TextStyles.text),
                ),
                const SizedBox(height: 24 + 34 + 48),
              ],
            ),
          ),

          //градиент
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),

          //кнопки
          PreOrderBtnAndFlag(carModel: carDetailsData.carModel),
        ],
      ),
    );
  }
}
