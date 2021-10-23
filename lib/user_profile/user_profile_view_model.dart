import 'package:flutter/material.dart';
import 'package:volvo_app/car_profile/car_profile_view_model.dart';

enum CardLevels {
  withoutCard,
  bronze,
  silver,
  gold,
  diamond,
}

class UserData {
  String name;
  String surname;
  String avatarURI;
  DateTime birthDate;
  String sex;

  UserData({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.sex,
    required this.avatarURI,
  });
}

class LoyaltyCard {
  String cardNumber;
  UserData userData;
  CardLevels cardLevel;
  double howManyPointsOnCard;

  LoyaltyCard({
    required this.cardNumber,
    required this.userData,
    required this.howManyPointsOnCard,
    required this.cardLevel,
  });

  // какой уровень карты у владельца исходя из количества баллов на ней
  CardLevels returnCardLevel() {
    if (howManyPointsOnCard < 50000) return CardLevels.bronze;
    if (howManyPointsOnCard >= 50000 && howManyPointsOnCard < 250000)
      // ignore: curly_braces_in_flow_control_structures
      return CardLevels.silver;
    if (howManyPointsOnCard >= 250000 && howManyPointsOnCard < 1250000)
      // ignore: curly_braces_in_flow_control_structures
      return CardLevels.gold;
    if (howManyPointsOnCard >= 1250000) return CardLevels.diamond;
    return CardLevels.withoutCard;
  }

  void addPointsToCard(int howManyPointsAdd) {
    howManyPointsOnCard += howManyPointsAdd;
    cardLevel = returnCardLevel();
  }
}

class UserProfileViewModel with ChangeNotifier {
  UserData userData = UserData(
    name: 'Егор',
    surname: 'Чуриков',
    birthDate: DateTime(2001, 12, 1),
    sex: 'Male',
    avatarURI: 'https://clck.ru/YMFMM',
  );

  LoyaltyCard card = LoyaltyCard(
    cardNumber: 'XC00309935877',
    userData: UserData(
      name: 'Егор',
      surname: 'Чуриков',
      birthDate: DateTime(2001, 12, 1),
      sex: 'Male',
      avatarURI: 'https://clck.ru/YMFMM',
    ),
    howManyPointsOnCard: 180000,
    cardLevel: CardLevels.silver,
  );

  List<CarProfile> cars = [
    CarProfile(
      model: 'VOLVO XC40 Recharge',
      number: 'C423CO 197 RUS',
      photoURI: 'assets/images/volvo_image_1.png', // пока что в assets
      purchaseDate: DateTime(2020, 1, 1),
      vin: '2C4GJ453XYR693697',
    ),
  ];
}
