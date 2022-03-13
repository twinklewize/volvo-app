import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:volvo_app/car_profile/car_profile_view_model.dart';
import 'package:http/http.dart' as http;

enum CardLevels {
  withoutCard,
  bronze,
  silver,
  gold,
  diamond,
}

class User {
  String? phone;
  String? password;

  User({
    required this.phone,
    required this.password,
  });
}

class UserData {
  String name;
  String surname;
  String avatarURI;
  DateTime birthDate;
  String sex;
  String referalCardNum;
  int balance;
  int cardProgress;
  bool hasRefferer;

  UserData({
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.sex,
    required this.avatarURI,
    required this.referalCardNum,
    required this.balance,
    required this.cardProgress,
    required this.hasRefferer,
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
    balance: 12000,
    referalCardNum: '09876543wsdfghjkl',
    cardProgress: 180000,
    hasRefferer: false,
  );

  Future<int> changeUserData(UserData userData) async {
    final url = Uri.parse('https://192.168.50.158:2021/api/userdata/change');

    final response = await http.post(
      url,
      headers: {
        // HttpHeaders has many properties like AUTHORIZATION, contentTypeHeader, acceptHeader etc. you can use them accordingly.
        HttpHeaders.contentTypeHeader: "application/json"
      },
      body: json.encode(
        {
          'name': 'Егор',
          'surname': 'Чуриков',
          'birthDate': DateTime(2001, 12, 1).toIso8601String(),
          'sex': 'Male',
          'balance': 12000,
          'referalCardNum': '09876543wsdfghjkl',
          'cardProgress': 180000,
          'hasRefferer': false,
        },
      ),
    );
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  Future<int> getUserData(UserData userData) async {
    final url = Uri.parse('https://192.168.50.158:2021/api/userdata/get');

    final response = await http.post(
      url,
      headers: {
        // HttpHeaders has many properties like AUTHORIZATION, contentTypeHeader, acceptHeader etc. you can use them accordingly.
        HttpHeaders.contentTypeHeader: "application/json"
      },
      body: json.encode(
        {
          'phoneNumber': user.phone,
        },
      ),
    );
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  User user = User(
    phone: null,
    password: null,
  );

  Future<int> login() async {
    final url = Uri.parse('http://192.168.50.158:2021/api/auth/login');

    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'phoneNumber': '88005553535',
          'password': '1234',
        },
      ),
    );

    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  Future<int> register() async {
    final url = Uri.parse('http://192.168.50.158:2021/api/auth/register');

    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'phoneNumber': user.phone,
          'password': user.password,
        },
      ),
    );
    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  LoyaltyCard card = LoyaltyCard(
    cardNumber: 'XC00309935877',
    userData: UserData(
      name: 'Егор',
      surname: 'Чуриков',
      birthDate: DateTime(2001, 12, 1),
      sex: 'Male',
      avatarURI: 'https://clck.ru/YMFMM',
      balance: 12000,
      referalCardNum: '09876543wsdfghjkl',
      cardProgress: 180000,
      hasRefferer: false,
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
