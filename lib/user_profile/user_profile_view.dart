import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/user_profile/components/card.dart';
import 'package:volvo_app/user_profile/components/diagram.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

// ignore: use_key_in_widget_constructors
class UserProfileView extends StatefulWidget {
  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView>
    with SingleTickerProviderStateMixin {
  late bool _showFrontSide;
  late bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: "Front",
      child: const Padding(
        padding: EdgeInsets.all(32.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: const ValueKey(false),
      backgroundColor: Colors.blue.shade700,
      faceName: "Rear",
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          child:
              Center(child: Text("Flutter", style: TextStyle(fontSize: 50.0))),
        ),
      ),
    );
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required Color backgroundColor}) {
    return Container(
      key: key,
      child: Center(
        child: PrivelegeClubCardView(_showFrontSide),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProfileViewModel>(context).userData;
    var card = Provider.of<UserProfileViewModel>(context).card;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 20),

            // appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/icons/back_button.svg'),
                    ),
                    // show more actions
                    GestureDetector(
                      onTap: () {
                        print('show more actions');
                      },
                      child: SvgPicture.asset(
                          'assets/icons/horizontal_more_button.svg'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // hello user and photo
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // hello, user
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Добро пожаловать,',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(132, 140, 144, 1),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.name + ' ' + user.surname,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // avatar
                    GestureDetector(
                      onTap: () {
                        print('change photo');
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.avatarURI),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // карта, которая тыкается и переворачивается
            _buildFlipAnimation(),

            const SizedBox(height: 16),

            // diagram
            Row(
              children: [
                const SizedBox(width: 18),
                // белый блок под карточкой
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width - 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.04),
                        spreadRadius: 4,
                        blurRadius: 18,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // сама диаграмма
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: PointsTracker(),
                      ),

                      SizedBox(width: 16),

                      // текст справа
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: const SizedBox()),
                            Text(
                              card.cardLevel == CardLevels.bronze
                                  ? 'Бронзовый'
                                  : card.cardLevel == CardLevels.silver
                                      ? 'Серебряный'
                                      : card.cardLevel == CardLevels.gold
                                          ? 'Золотой'
                                          : card.cardLevel == CardLevels.diamond
                                              ? 'Бриллиантовый'
                                              : 'Базовый',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Text(
                                'Потратьте еще 70.000 руб. в официальном магазине Volvo или у партнеров до 31.12.2021',
                                style: TextStyle(
                                  color: Color.fromRGBO(113, 123, 137, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              child: const Text(
                                'Как это работает?',
                                style: TextStyle(
                                  color: VolvoColors.firstColor,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () async {},
                            ),
                            Expanded(child: const SizedBox()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 18),
              ],
            ),

            const SizedBox(height: 40),

            Row(
              children: const [
                SizedBox(width: 24),
                Text(
                  'Ваши преимущества:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(49, 56, 61, 1),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // список возможностей
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  // диагностика
                  PossabilityWidget('5%', 'Скидка у партнеров Volvo'),
                  PossabilityWidget('3%', 'Скидка на новый Volvo'),
                  PossabilityWidget('Всегда', 'Помощь на дороге'),
                  PossabilityWidget('Всегда', 'Бесплатный кофе в серивсе'),
                  PossabilityWidget('Инфо', 'О программе лояльности'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: const [
                SizedBox(width: 24),
                Text(
                  'Реферальная программа',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(49, 56, 61, 1),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // список возможностей
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 18),
                  // диагностика
                  PossabilityWidget('1', 'Осталось приглашений'),
                  PossabilityWidget('Показать QR', 'Нажмите, чтобы показать'),
                  PossabilityWidget('Считать QR', 'Нажмите, чтобы сканировать'),
                  PossabilityWidget('Инфо', 'Про реферальную программу'),
                ],
              ),
            ),

            SizedBox(height: 40),

            GestureDetector(
              onTap: () {
                //
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: VolvoColors.firstColor,
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width - 36,
                  child: const Center(
                    child: Text(
                      'Магазин лояльности',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PossabilityWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  PossabilityWidget(
    this.firstText,
    this.secondText,
  );

  String firstText;
  String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 88,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.02),
              spreadRadius: 4,
              blurRadius: 18,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6),
              Text(
                secondText,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(113, 123, 137, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
