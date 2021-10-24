// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volvo_app/home/home_view.dart';
import 'package:volvo_app/main.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);

  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 80),
          Spacer(),

          // logo
          Row(
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/icons/volvo_logo.svg',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              Spacer(),
            ],
          ),

          Spacer(),

          CustomTextField(
            hintText: 'Телефон',
            controller: controllerPhone,
            setValue: (value) {
              //
            },
            keyboardType: TextInputType.phone,
          ),

          SizedBox(height: 10),

          CustomTextField(
            hintText: 'Пароль',
            controller: controllerPassword,
            setValue: (value) {
              //
            },
            keyboardType: TextInputType.visiblePassword,
          ),

          SizedBox(height: 20),

          // забыли пароль?
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  //
                },
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: VolvoColors.secondColor,
                  ),
                ),
              ),
              SizedBox(width: 24),
            ],
          ),

          SizedBox(height: 40),

          // кнопка
          GestureDetector(
            onTap: () {
              //
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              decoration: BoxDecoration(
                color: VolvoColors.firstColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Регистрация',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // кнопка
          GestureDetector(
            onTap: () {
              //
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 36,
              decoration: BoxDecoration(
                color: Color(0xFFDDE7FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Вход',
                  style: TextStyle(
                    color: VolvoColors.firstColor,
                  ),
                ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function setValue;
  final keyboardType;
  final TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    required this.hintText,
    required this.setValue,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      width: size.width - 36,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              spreadRadius: 4,
              color: Color.fromRGBO(1, 1, 1, 0.05),
            ),
          ]),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onSaved: (value) => {
          setValue(value == null ? '' : value.trim()),
        },
        validator: (value) {
          if (value != null && value.length > 4) {
            return;
          }
        },
        cursorColor: VolvoColors.firstColor,
        cursorHeight: 20,
        cursorWidth: 3,
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
