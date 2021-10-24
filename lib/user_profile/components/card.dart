import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class PrivelegeClubCardView extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  PrivelegeClubCardView(this.isFrontSide);

  bool isFrontSide;

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserProfileViewModel>(context);
    return Container(
      height: 207 + 32 + 32,
      width: MediaQuery.of(context).size.width - 36,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            spreadRadius: 4,
            blurRadius: 18,
            offset: Offset(0, 14), // changes position of shadow
          ),
        ],
      ),
      child: isFrontSide
          // передняя сторона карты
          ? Center(
              child: viewModel.card.cardLevel == CardLevels.withoutCard
                  // нет аккаунта
                  ? Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/card_bronze.svg',
                          width: MediaQuery.of(context).size.width - 36,
                        ),
                        // Баланс
                        Positioned(
                          left: 24,
                          bottom: 74,
                          child: Text(
                            'Баланс',
                            style: const TextStyle(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // сколько бонусов
                        Positioned(
                          left: 24,
                          bottom: 32,
                          child: Row(
                            children: [
                              Text(
                                viewModel.card.howManyPointsOnCard
                                    .toStringAsFixed(0),
                                style: TextStyle(
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 4),
                                child: Text(
                                  'бонусов',
                                  style: TextStyle(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // PRIVILEGE СLUB
                        const Positioned(
                          left: 24,
                          top: 32,
                          child: Text(
                            'Privilege Club',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // значок бесконечности
                        Positioned(
                          right: 24,
                          bottom: 32,
                          child: SvgPicture.asset('assets/icons/infinity.svg'),
                        ),
                      ],
                    )
                  : viewModel.card.cardLevel == CardLevels.bronze
                      // бронзовый
                      ? Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/images/card_bronze.svg',
                              width: MediaQuery.of(context).size.width - 36,
                            ),
                            // Баланс
                            Positioned(
                              left: 24,
                              bottom: 74,
                              child: Text(
                                'Баланс',
                                style: const TextStyle(
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            // сколько бонусов
                            Positioned(
                              left: 24,
                              bottom: 32,
                              child: Row(
                                children: [
                                  Text(
                                    viewModel.card.howManyPointsOnCard
                                        .toStringAsFixed(0),
                                    style: TextStyle(
                                      color: Color.fromRGBO(242, 242, 242, 1),
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 10, left: 4),
                                    child: Text(
                                      'бонусов',
                                      style: TextStyle(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // PRIVILEGE СLUB
                            const Positioned(
                              left: 24,
                              top: 32,
                              child: Text(
                                'Privilege Club',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            // значок бесконечности
                            Positioned(
                              right: 24,
                              bottom: 32,
                              child:
                                  SvgPicture.asset('assets/icons/infinity.svg'),
                            ),
                          ],
                        )
                      : viewModel.card.cardLevel == CardLevels.silver
                          // серебряный
                          ? Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/card_silver.svg',
                                  width: MediaQuery.of(context).size.width - 36,
                                ),
                                // Баланс
                                Positioned(
                                  left: 24,
                                  bottom: 74,
                                  child: Text(
                                    'Баланс',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(242, 242, 242, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                // сколько бонусов
                                Positioned(
                                  left: 24,
                                  bottom: 32,
                                  child: Row(
                                    children: [
                                      Text(
                                        viewModel.card.howManyPointsOnCard
                                            .toStringAsFixed(0),
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 4),
                                        child: Text(
                                          'бонусов',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                242, 242, 242, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // PRIVILEGE СLUB
                                const Positioned(
                                  left: 24,
                                  top: 32,
                                  child: Text(
                                    'Privilege Club',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                // значок бесконечности
                                Positioned(
                                  right: 24,
                                  bottom: 32,
                                  child: SvgPicture.asset(
                                      'assets/icons/infinity.svg'),
                                ),
                              ],
                            )
                          : viewModel.card.cardLevel == CardLevels.gold
                              // золотой
                              ? Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/card_gold.svg',
                                      width: MediaQuery.of(context).size.width -
                                          36,
                                    ),
                                    // Баланс
                                    Positioned(
                                      left: 24,
                                      bottom: 74,
                                      child: Text(
                                        'Баланс',
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    // сколько бонусов
                                    Positioned(
                                      left: 24,
                                      bottom: 32,
                                      child: Row(
                                        children: [
                                          Text(
                                            viewModel.card.howManyPointsOnCard
                                                .toStringAsFixed(0),
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 4),
                                            child: Text(
                                              'бонусов',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    242, 242, 242, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // PRIVILEGE СLUB
                                    const Positioned(
                                      left: 24,
                                      top: 32,
                                      child: Text(
                                        'Privilege Club',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    // значок бесконечности
                                    Positioned(
                                      right: 24,
                                      bottom: 32,
                                      child: SvgPicture.asset(
                                          'assets/icons/infinity.svg'),
                                    ),
                                  ],
                                )
                              // бриллиантовый
                              : Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/card_diamond.svg',
                                      width: MediaQuery.of(context).size.width -
                                          36,
                                    ),
                                    // Баланс
                                    Positioned(
                                      left: 24,
                                      bottom: 74,
                                      child: Text(
                                        'Баланс',
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    // сколько бонусов
                                    Positioned(
                                      left: 24,
                                      bottom: 32,
                                      child: Row(
                                        children: [
                                          Text(
                                            viewModel.card.howManyPointsOnCard
                                                .toStringAsFixed(0),
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 4),
                                            child: Text(
                                              'бонусов',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    242, 242, 242, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // PRIVILEGE СLUB
                                    const Positioned(
                                      left: 24,
                                      top: 32,
                                      child: Text(
                                        'Privilege Club',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    // значок бесконечности
                                    Positioned(
                                      right: 24,
                                      bottom: 32,
                                      child: SvgPicture.asset(
                                          'assets/icons/infinity.svg'),
                                    ),
                                  ],
                                ),
            )
          :
          // задняя сторона карты
          Center(
              child: viewModel.card.cardLevel == CardLevels.withoutCard
                  // нет аккаунта
                  ? Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/card_bronze.svg',
                          width: MediaQuery.of(context).size.width - 36,
                        ),
                        // номер карты
                        Positioned(
                          bottom: 32,
                          left: MediaQuery.of(context).size.width / 2 - 140,
                          right: MediaQuery.of(context).size.width / 2 - 140,
                          child: Text(
                            viewModel.card.cardNumber.toUpperCase(),
                            style: const TextStyle(
                              letterSpacing: 10,
                              color: Color.fromRGBO(242, 242, 242, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        // qr
                        Positioned(
                          top: 36,
                          left: MediaQuery.of(context).size.width / 2 - 75,
                          right: MediaQuery.of(context).size.width / 2 - 75,
                          child: QrImage(
                            data: viewModel.card.cardNumber,
                            foregroundColor: Colors.white,
                            version: QrVersions.auto,
                            size: 150.0,
                          ),
                        ),
                      ],
                    )
                  : viewModel.card.cardLevel == CardLevels.bronze
                      // бронзовый
                      ? Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/images/card_bronze.svg',
                              width: MediaQuery.of(context).size.width - 36,
                            ),
                            // номер карты
                            Positioned(
                              bottom: 32,
                              left: MediaQuery.of(context).size.width / 2 - 140,
                              right:
                                  MediaQuery.of(context).size.width / 2 - 140,
                              child: Text(
                                viewModel.card.cardNumber.toUpperCase(),
                                style: const TextStyle(
                                  letterSpacing: 10,
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            // qr
                            Positioned(
                              top: 36,
                              left: MediaQuery.of(context).size.width / 2 - 75,
                              right: MediaQuery.of(context).size.width / 2 - 75,
                              child: QrImage(
                                data: viewModel.card.cardNumber,
                                foregroundColor: Colors.white,
                                version: QrVersions.auto,
                                size: 150.0,
                              ),
                            ),
                          ],
                        )
                      : viewModel.card.cardLevel == CardLevels.silver
                          // серебряный
                          ? Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/card_silver.svg',
                                  width: MediaQuery.of(context).size.width - 36,
                                ),
                                // номер карты
                                Positioned(
                                  bottom: 32,
                                  left: MediaQuery.of(context).size.width / 2 -
                                      150,
                                  right: MediaQuery.of(context).size.width / 2 -
                                      150,
                                  child: Text(
                                    viewModel.card.cardNumber.toUpperCase(),
                                    style: const TextStyle(
                                      letterSpacing: 10,
                                      color: Color.fromRGBO(242, 242, 242, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                // qr
                                Positioned(
                                  top: 36,
                                  left: MediaQuery.of(context).size.width / 2 -
                                      75,
                                  right: MediaQuery.of(context).size.width / 2 -
                                      75,
                                  child: QrImage(
                                    data: viewModel.card.cardNumber,
                                    foregroundColor: Colors.white,
                                    version: QrVersions.auto,
                                    size: 150.0,
                                  ),
                                ),
                              ],
                            )
                          : viewModel.card.cardLevel == CardLevels.gold
                              // золотой
                              ? Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/card_gold.svg',
                                      width: MediaQuery.of(context).size.width -
                                          36,
                                    ),
                                    // номер карты
                                    Positioned(
                                      bottom: 32,
                                      left: MediaQuery.of(context).size.width /
                                              2 -
                                          140,
                                      right: MediaQuery.of(context).size.width /
                                              2 -
                                          140,
                                      child: Text(
                                        viewModel.card.cardNumber.toUpperCase(),
                                        style: const TextStyle(
                                          letterSpacing: 10,
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),

                                    // qr
                                    Positioned(
                                      top: 36,
                                      left: MediaQuery.of(context).size.width /
                                              2 -
                                          75,
                                      right: MediaQuery.of(context).size.width /
                                              2 -
                                          75,
                                      child: QrImage(
                                        data: viewModel.card.cardNumber,
                                        foregroundColor: Colors.white,
                                        version: QrVersions.auto,
                                        size: 150.0,
                                      ),
                                    ),
                                  ],
                                )
                              // бриллиантовый
                              : Stack(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/card_diamond.svg',
                                      width: MediaQuery.of(context).size.width -
                                          36,
                                    ),

                                    // номер карты
                                    Positioned(
                                      bottom: 32,
                                      left: MediaQuery.of(context).size.width /
                                              2 -
                                          140,
                                      right: MediaQuery.of(context).size.width /
                                              2 -
                                          140,
                                      child: Text(
                                        viewModel.card.cardNumber.toUpperCase(),
                                        style: const TextStyle(
                                          letterSpacing: 10,
                                          color:
                                              Color.fromRGBO(242, 242, 242, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),

                                    // qr
                                    Positioned(
                                      top: 36,
                                      left: MediaQuery.of(context).size.width /
                                              2 -
                                          75,
                                      right: MediaQuery.of(context).size.width /
                                              2 -
                                          75,
                                      child: QrImage(
                                        data: viewModel.card.cardNumber,
                                        foregroundColor: Colors.white,
                                        version: QrVersions.auto,
                                        size: 150.0,
                                      ),
                                    ),
                                  ],
                                ),
            ),
    );
  }
}
