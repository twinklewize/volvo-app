import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volvo_app/main.dart';

class FeedbackFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 36,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 18,
                    spreadRadius: 4,
                    color: Color(0xFF0000000A))
              ]),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Image.network(
                  'https://assets.volvocars.com/en-th/~/media/shared-assets/images/galleries/own/owner-info/vps/ev_vps_2_video.jpg',
                  width: MediaQuery.of(context).size.width - 36,
                ),
              ),
              SizedBox(height: 16),
              RatingBar.builder(
                initialRating: 4,
                ignoreGestures: true,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 50,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3.5),
                itemBuilder: (context, _) =>
                    SvgPicture.asset('assets/icons/star.svg'),
                onRatingUpdate: (rating) {
                  // ignore: avoid_print
                  print(rating);
                },
              ),
              SizedBox(height: 36),
              Text(
                'VOLVO CAR ТУЛЬСКАЯ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'VolvoNovum',
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Оцените техобслуживание в сервисе. Для нас важно ваше мнение.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'VolvoNovum',
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 24.0,
                  left: 24,
                  bottom: 36,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width / 2 - 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDE7FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Отменить',
                            style: TextStyle(
                              fontFamily: 'VolvoNovum',
                              color: VolvoColors.firstColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width / 2 - 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF162870),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Подтвердить',
                            style: TextStyle(
                              fontFamily: 'VolvoNovum',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
