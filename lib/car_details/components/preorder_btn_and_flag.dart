import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volvo_app/test_drive_form/test_drive_form_view.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class PreOrderBtnAndFlag extends StatelessWidget {
  String carModel;
  PreOrderBtnAndFlag({required this.carModel});
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
                color: Colors.white,
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
        return TestDriveFormView(
          ctx: context,
          carModel: carModel,
        );
      },
    );
  }
}
