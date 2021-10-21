import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  String _selectedPage = 'car_profile';

  String get selectedPage => _selectedPage;

  void selectPage(String page) {
    _selectedPage = page;
    notifyListeners();
  }
}
