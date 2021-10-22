// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volvo_app/main.dart';

// ignore: non_constant_identifier_names
Widget UniversalTextField({
  required Function(String?) onChanged,
  required String label,
  required TextEditingController controller,
  required Color fillColor,
  bool? obscureText,
  required String labelText,
  dynamic suffixIcon,
  dynamic prefixIcon,
  List<TextInputFormatter>? formatters,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  int? maxLines,
  int? minLines,
  //EdgeInsetsGeometry? contentPadding,
  String? secondStringToMatch,
  Color? inputTextColor,
}) {
  return TextFormField(
    onChanged: (val) {
      onChanged(val);
    },
    controller: controller,
    obscureText: obscureText ?? false,
    cursorColor: VolvoColors.firstColor,
    showCursor: true,
    cursorHeight: 26,
    cursorWidth: 2,
    maxLines: maxLines,
    minLines: minLines,
    cursorRadius: Radius.circular(2),
    textInputAction: textInputAction,
    style: TextStyle(
      color: inputTextColor ?? Colors.black,
    ),
    decoration: InputDecoration(
      isDense: true,
      contentPadding: // Text Field height
          EdgeInsets.only(
        top: 12,
        bottom: 12,
        right: 14,
        //left: 14,
      ),
      fillColor: fillColor,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color.fromRGBO(113, 118, 122, 1),
      ),
      labelText: prefixIcon == null ? '    $labelText' : labelText,
      prefixText: prefixIcon == null ? '    ' : '',
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      suffixIcon: suffixIcon,
    ),
    inputFormatters: (formatters != null) ? [...formatters] : null,
    keyboardType: keyboardType,
  );
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class AppbarWithSearch extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  AppbarWithSearch({
    required this.controller,
  });

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
        height: 54,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.18),
              spreadRadius: 4,
              blurRadius: 24,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 8),

            // burger
            SvgPicture.asset(
              'assets/icons/drawer.svg',
              color: Colors.black,
              fit: BoxFit.none,
            ),

            SizedBox(width: 18),

            SizedBox(
              height: 42,
              width: MediaQuery.of(context).size.width - 152,
              child: UniversalTextField(
                onChanged: (val) {
                  print(val);
                },
                label: 'Введите адрес',
                controller: controller,
                fillColor: Color.fromRGBO(242, 244, 245, 1),
                labelText: 'Введите адрес',
              ),
            ),

            SizedBox(width: 16),

            // avatar
            Container(
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://clck.ru/YMFMM'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
