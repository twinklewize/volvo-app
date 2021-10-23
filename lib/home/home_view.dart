import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/drawer/drawer.dart';
import 'package:volvo_app/widgets/tabbar.dart';
import 'home_view_model.dart';
import '../chat/chat_view.dart';
import '../map/map_view.dart';
import '../volvo/volvo_view.dart';
import '../car_profile/car_profile_view.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class HomeView extends StatelessWidget {
  String page = "car_profile";

  @override
  Widget build(BuildContext context) {
    page = Provider.of<HomeViewModel>(context).selectedPage;
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: Tabbar(page),
      //backgroundColor: VolvoColors.backgroundColor,
      body: (page == "car_profile")
          ? CarProfileView()
          : (page == "map")
              ? MapView()
              : (page == "chat")
                  ? ChatView()
                  : (page == "volvo")
                      ? VolvoView()
                      : Container(),
    );
  }
}
