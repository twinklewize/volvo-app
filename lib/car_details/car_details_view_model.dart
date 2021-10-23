import 'package:flutter/cupertino.dart';
import 'package:volvo_app/car_details/components/pecularity_cards.dart';

class CarDetailsViewModel extends ChangeNotifier {
  int _colorIndex = 5;
  String _carModel = 'VOLVO XC40 Recharge';
  String _title = 'Создан с уважением и заботой';
  String _text =
      'C40 Recharge — это первый автомобиль Volvo, в котором полностью отсутствует натуральная кожа в салоне, включая руль, рычаг переключения передач и обивку. Мы считаем, что это новая, более уважительная к окружающей среде интерпретация роскоши и использования материалов в дизайне салона.';
  var _pecuraties = [
    {
      'title': '420 км',
      'text': 'Запас хода на электрической тяге',
    },
    {
      'title': '4.7 секунд',
      'text': 'Разгон с 0 до 100 км/час',
    },
    {
      'title': '100%',
      'text': 'Без использования натуральной кожи',
    },
  ];

  var _colorImages = [
    'assets/images/car_detail_image0.png',
    'assets/images/car_detail_image1.png',
    'assets/images/car_detail_image2.png',
    'assets/images/car_detail_image3.png',
    'assets/images/car_detail_image4.png',
    'assets/images/car_detail_image5.png',
    'assets/images/car_detail_image6.png',
  ];

  setColorIndex(int colorIndex) {
    _colorIndex = colorIndex;
    notifyListeners();
  }

  get carModel => _carModel;
  get title => _title;
  get text => _text;
  get colorIndex => _colorIndex;
  get colorImages => _colorImages;
  get pecularities => _pecuraties;
}
