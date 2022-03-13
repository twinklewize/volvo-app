import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/auth/auth_view.dart';
import 'package:volvo_app/car_details/car_details_view_model.dart';
import 'package:volvo_app/car_profile/car_profile_view_model.dart';
import 'package:volvo_app/chat/chat_view_model.dart';
import 'package:volvo_app/home/home_view_model.dart';
import 'package:volvo_app/map/map_view_model.dart';
import 'package:volvo_app/test_drive_form/test_drive_form_view_model.dart';
import 'package:volvo_app/volvo/volvo_view_model.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // status bar - верхняя панель, где время, заряд батарнеи итд
        // system navigation bar - android "phisical" back. home and other buttons
        systemNavigationBarIconBrightness:
            Brightness.dark, // цвет кнопок system navigation bar
        statusBarBrightness: Brightness
            .light, // light если нужны черные значки на светлом фоне (IOS)
        statusBarIconBrightness: Brightness
            .dark, // light если нужны черные значки на светлом фоне (IOS) (андроид)
        systemNavigationBarColor: Colors.white, // system navigation bar color
        statusBarColor: VolvoColors.backgroundColor,
      ),
    );
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
        ChangeNotifierProvider.value(
          value: UserProfileViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: TestDriveViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: CarDetailsViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: AuthView(),
        theme: ThemeData(
          primaryColor: VolvoColors.firstColor,
        ),
        //HomeView()
      ),
    );
  }
}

class VolvoColors {
  static const Color backgroundColor = Color.fromRGBO(247, 249, 250, 1);
  static const Color firstColor = Color.fromRGBO(22, 40, 112, 1);
  static const Color secondColor = Color.fromRGBO(140, 142, 146, 1);
  static const Color thirdColor = Color.fromRGBO(188, 197, 204, 1);
}
