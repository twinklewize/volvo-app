import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/car_profile/car_profile_view_model.dart';
import 'package:volvo_app/chat/chat_view_model.dart';
import 'package:volvo_app/home/home_view.dart';
import 'package:volvo_app/home/home_view_model.dart';
import 'package:volvo_app/map/map_view_model.dart';
import 'package:volvo_app/volvo/volvo_view_model.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: VolvoViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: MapViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: ChatViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: CarProfileViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: HomeView(),
      ),
    );
  }
}

class VolvoColors {
  static const Color backgroundColor = Color.fromRGBO(247, 249, 250, 1);
  static const Color firstColor = Color.fromRGBO(22, 40, 112, 1);
  static const Color secondColor = Color.fromRGBO(188, 197, 204, 1);
}
