import 'package:flutter/material.dart';

class CarProfile {
  // модель машины
  String model;

  // номер
  String number;

  // фото машины с сайта volvo
  String photoURI;

  // день покупки машины
  DateTime purchaseDate;

  // Идентификационный номер транспортного средства
  String vin;

  // Информация о деталях
  dynamic parts;

  // График пробега
  dynamic mileageSchedule;

  // сервисная книжка
  dynamic serviceBook;

  // история ТО
  dynamic historyOfMaintenance;

  CarProfile({
    required this.model,
    required this.number,
    required this.photoURI,
    required this.purchaseDate,
    required this.vin,
  });
}

class CarProfileViewModel with ChangeNotifier {
  // List<CarProfile> cars = [
  //   CarProfile(
  //     model: 'VOLVO XC40 Recharge',
  //     number: 'C423CO 197 RUS',
  //     photoURI: 'assets/images/volvo_image_1.png', // пока что в assets
  //     purchaseDate: DateTime(2020, 1, 1),
  //     vin: '2C4GJ453XYR693697',
  //   ),
  // ];
}
