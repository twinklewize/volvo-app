import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/user_profile/user_profile_view_model.dart';

// ignore: use_key_in_widget_constructors
class PrivelegeClubCardView extends StatelessWidget {
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
      child: Center(
        child: viewModel.card.cardLevel == CardLevels.withoutCard
            // нет аккаунта
            ? Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/card_bronze.svg',
                    width: MediaQuery.of(context).size.width - 36,
                  ),
                  // имя фамилия
                  Positioned(
                    left: 24,
                    bottom: 54,
                    child: Text(
                      viewModel.card.user.name.toUpperCase() +
                          ' ' +
                          viewModel.card.user.surname.toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // уровень привилегий
                  const Positioned(
                    left: 24,
                    bottom: 32,
                    child: Text(
                      'ДЕМО',
                      style: TextStyle(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
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
                      // имя фамилия
                      Positioned(
                        left: 24,
                        bottom: 54,
                        child: Text(
                          viewModel.card.user.name.toUpperCase() +
                              ' ' +
                              viewModel.card.user.surname.toUpperCase(),
                          style: const TextStyle(
                            color: Color.fromRGBO(242, 242, 242, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      // уровень привилегий
                      const Positioned(
                        left: 24,
                        bottom: 32,
                        child: Text(
                          'БРОНЗОВЫЙ',
                          style: TextStyle(
                            color: Color.fromRGBO(242, 242, 242, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                : viewModel.card.cardLevel == CardLevels.silver
                    // серебряный
                    ? Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/images/card_silver.svg',
                            width: MediaQuery.of(context).size.width - 36,
                          ),
                          // имя фамилия
                          Positioned(
                            left: 24,
                            bottom: 54,
                            child: Text(
                              viewModel.card.user.name.toUpperCase() +
                                  ' ' +
                                  viewModel.card.user.surname.toUpperCase(),
                              style: const TextStyle(
                                color: Color.fromRGBO(242, 242, 242, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // уровень привилегий
                          const Positioned(
                            left: 24,
                            bottom: 32,
                            child: Text(
                              'СЕРЕБРЯНЫЙ',
                              style: TextStyle(
                                color: Color.fromRGBO(242, 242, 242, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
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
                    : viewModel.card.cardLevel == CardLevels.gold
                        // золотой
                        ? Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/images/card_gold.svg',
                                width: MediaQuery.of(context).size.width - 36,
                              ),
                              // имя фамилия
                              Positioned(
                                left: 24,
                                bottom: 54,
                                child: Text(
                                  viewModel.card.user.name.toUpperCase() +
                                      ' ' +
                                      viewModel.card.user.surname.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // уровень привилегий
                              const Positioned(
                                left: 24,
                                bottom: 32,
                                child: Text(
                                  'ЗОЛОТОЙ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
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
                                width: MediaQuery.of(context).size.width - 36,
                              ),
                              // имя фамилия
                              Positioned(
                                left: 24,
                                bottom: 54,
                                child: Text(
                                  viewModel.card.user.name.toUpperCase() +
                                      ' ' +
                                      viewModel.card.user.surname.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              // уровень привилегий
                              const Positioned(
                                left: 24,
                                bottom: 32,
                                child: Text(
                                  'БРИЛЛИАНТОВЫЙ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(242, 242, 242, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
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
      ),
    );
  }
}
