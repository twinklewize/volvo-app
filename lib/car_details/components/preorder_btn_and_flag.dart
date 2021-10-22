import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class PreOrderBtnAndFlag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 34,
          right: 18,
          left: 18,
        ),
        child: Row(
          children: [
            //pre-order button
            GestureDetector(
              onTap: () {
                TestDriveModalBottomSheet(context);
              },
              child: Container(
                height: 48,
                width: size.width - (48 + 36 + 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF162870),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Предзаказ',
                    style: TextStyles.buttonText,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            //Flag button
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF162870),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                'assets/icons/flag.svg',
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> TestDriveModalBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: MediaQuery.of(context).viewInsets.bottom > 0 ? 1 : 0.92,
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: SvgPicture.asset(
                      'assets/icons/volvo_logo.svg',
                      height: 16,
                    ),
                  ),
                  const SizedBox(height: 11),
                  const Text(
                    'VOLVO XC40 Recharge',
                    style: TextStyle(
                      color: Color(0xFF555F66),
                      fontSize: 14,
                      fontFamily: 'VolvoNovum',
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'ЗАПРОС ТЕСТ-ДРАЙВА',
                    style: TextStyle(
                      color: Color(0xFF060606),
                      fontSize: 14,
                      fontFamily: 'VolvoNovum',
                    ),
                  ),
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: const Text(
                        'Персональные данные',
                        style: TextStyle(
                          color: Color(0xFF31383D),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'VolvoNovum',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(hintText: 'Введите фамилию'),
                  const SizedBox(height: 10),
                  CustomTextField(hintText: 'Введите имя'),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: const Text(
                        'Контактные данные',
                        style: TextStyle(
                          color: Color(0xFF31383D),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'VolvoNovum',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(hintText: 'Введите город'),
                  const SizedBox(height: 10),
                  CustomTextField(hintText: 'Введите телефон'),
                  const SizedBox(height: 10),
                  CustomTextField(hintText: 'Введите почту'),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: size.width - 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFF162870),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Отправить запрос',
                          style: TextStyles.buttonText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> CarSeriesModalBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.92,
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: SvgPicture.asset(
                      'assets/icons/volvo_logo.svg',
                      height: 16,
                    ),
                  ),
                  const SizedBox(height: 11),
                  const Text(
                    'XC серия',
                    style: TextStyle(
                      color: Color(0xFF555F66),
                      fontSize: 14,
                      fontFamily: 'VolvoNovum',
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: size.width - 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'VolvoNovum',
            fontSize: 16,
            color: Color(0xFF75777A),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
