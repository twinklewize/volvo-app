// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';
import 'package:volvo_app/widgets/appbar.dart';
import 'package:volvo_app/widgets/car_picture.dart';
import 'package:volvo_app/widgets/last_service_container_with_button.dart';
import 'package:volvo_app/widgets/model.dart';
import 'package:volvo_app/widgets/white_fat_container.dart';

class CarProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var car = Provider.of<UserProfileViewModel>(context).cars[0];
    return SingleChildScrollView(
      child: Column(
        children: [
          // appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CarProfileAppbar(),
          ),

          const SizedBox(height: 25),

          // модель машины
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CarModel(model: car.model),
          ),

          const SizedBox(height: 4),

          // номерной знак
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              car.number,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: VolvoColors.secondColor,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // фото машины
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CarPicture(imageURI: car.photoURI),
          ),

          const SizedBox(height: 24),

          // список возможностей
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 18),
                // диагностика
                WhiteFatContainer(
                  title: 'Диагностика',
                  svgIconPath: 'assets/icons/diagnostics.svg',
                  number: 1,
                ),
                // диагностика
                WhiteFatContainer(
                  title: 'Обслуживание',
                  svgIconPath: 'assets/icons/services.svg',
                  number: 1,
                ),
                // диагностика
                WhiteFatContainer(
                  title: 'Информация',
                  svgIconPath: 'assets/icons/information.svg',
                  number: 0,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // title последнее обслуживание
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'ПОСЛЕДНЕЕ ОБСЛУЖИВАНИЕ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: VolvoColors.secondColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // последнее обслуживание
          LastServiceContainerWithButton(
            serviceName: 'VOLVO CAR ТУЛЬСКАЯ',
            amount: 12200,
            dateTime: DateTime(2021, 22, 10),
            address: 'Москва, Холодильный пер., 6',
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
