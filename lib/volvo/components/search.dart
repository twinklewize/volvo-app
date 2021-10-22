// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volvo_app/volvo/components/constants.dart';

// ignore: use_key_in_widget_constructors
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: ContainerStyles.shadowStyle,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: const Color(0xFF71767a),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: TextStyles.hintText,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  //suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: SvgPicture.asset(
                'assets/icons/filters.svg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
