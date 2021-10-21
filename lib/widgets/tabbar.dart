import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/home/home_view_model.dart';
import 'package:volvo_app/main.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Tabbar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Tabbar(this.currentPage);

  String currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // volvo
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('volvo');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 50,
                  child: SvgPicture.asset(
                    'assets/icons/volvo.svg',
                    color: currentPage == 'volvo'
                        ? VolvoColors.firstColor
                        : VolvoColors.secondColor,
                    fit: BoxFit.none,
                  ),
                ),
              ),

              // map
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('map');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 50,
                  child: SvgPicture.asset(
                    'assets/icons/map.svg',
                    color: currentPage == 'map'
                        ? VolvoColors.firstColor
                        : VolvoColors.secondColor,
                    fit: BoxFit.none,
                  ),
                ),
              ),

              // chat
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('chat');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 50,
                  child: SvgPicture.asset(
                    'assets/icons/chat.svg',
                    color: currentPage == 'chat'
                        ? VolvoColors.firstColor
                        : VolvoColors.secondColor,
                    fit: BoxFit.none,
                  ),
                ),
              ),

              // car_profile
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('car_profile');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 50,
                  child: SvgPicture.asset(
                    'assets/icons/car_profile.svg',
                    color: currentPage == 'car_profile'
                        ? VolvoColors.firstColor
                        : VolvoColors.secondColor,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
