import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class LastServiceContainerWithButton extends StatelessWidget {
  LastServiceContainerWithButton({
    required this.serviceName,
    required this.amount,
    required this.dateTime,
    required this.address,
  });

  final String serviceName;
  final int amount;
  final DateTime dateTime;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(34, 42, 53, 1),
                  ),
                ),
                Text(
                  '$amount ₽',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(34, 42, 53, 1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('dd.MM.yyyy').format(dateTime),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(140, 142, 146, 1),
                  ),
                ),
                const Text(
                  ' · ',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(140, 142, 146, 1),
                  ),
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(140, 142, 146, 1),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/icons/divider.svg',
            width: MediaQuery.of(context).size.width - 36,
          ),
          GestureDetector(
            onTap: () {
              print('Посмотреть всю историю обслуживаний');
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 36,
              color: Colors.transparent,
              child: const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Center(
                  child: Text(
                    'Посмотреть всю историю обслуживаний',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(34, 42, 53, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
