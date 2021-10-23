import 'package:flutter/cupertino.dart';

class TestDriveViewModel extends ChangeNotifier {
  // ignore: unused_field
  late TestDriveData _data;

  setData(TestDriveData data) {
    _data = data;
    print(_data.town);
  }
}

class TestDriveData {
  String name;
  String surname;
  String town;
  int phone;
  String mail;
  String carModel;

  TestDriveData({
    required this.name,
    required this.surname,
    required this.town,
    required this.phone,
    required this.mail,
    required this.carModel,
  });
}
