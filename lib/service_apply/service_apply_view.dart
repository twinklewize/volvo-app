// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:volvo_app/main.dart';
import 'package:volvo_app/map/map_view_model.dart';

class ServiceApplyView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  ServiceApplyView({
    required this.service,
  });

  MapMarker service;

  @override
  State<ServiceApplyView> createState() => _ServiceApplyViewState();
}

class _ServiceApplyViewState extends State<ServiceApplyView> {
  // ignore: avoid_init_to_null
  DateTime? selectedDate = null;
  // ignore: avoid_init_to_null
  TimeOfDay? selectedTime = null;
  bool? isChecked = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                      Text(
                        widget.service.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
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
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: NetworkImage(
                        'https://assets.volvocars.com/en-th/~/media/shared-assets/images/galleries/own/owner-info/vps/ev_vps_2_video.jpg'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Выгодное ТО Volvo от официального дилера. Контроль качества и оригинальные запчасти. На Школьной. Официальный дилер VOLVO.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Холодильный пер., 6, Москва, 115191',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Часы работы сегодня: 10:00 - 20:00',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              Expanded(child: SizedBox()),

              // выбор даты для записи
              Row(
                children: [
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: VolvoColors.thirdColor,
                      ),
                      height: 30,
                      width: MediaQuery.of(context).size.width / 2 - 36,
                      child: Center(
                        child: Text(
                          'Выбрать дату',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  selectedDate != null
                      ? Padding(
                          padding: EdgeInsets.only(),
                          child: Text(
                            DateFormat.yMMMd().format(selectedDate!),
                          ),
                        )
                      : Container(),
                ],
              ),

              const Expanded(child: SizedBox()),

              // выбор времени для записи
              Row(
                children: [
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: VolvoColors.thirdColor,
                      ),
                      height: 30,
                      width: MediaQuery.of(context).size.width / 2 - 36,
                      child: const Center(
                        child: Text(
                          'Выбрать время',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 18),
                  selectedTime != null
                      ? Padding(
                          padding: EdgeInsets.only(),
                          child: Text(
                            '${selectedTime!.hour}:${selectedTime!.minute}',
                          ),
                        )
                      : Container(),
                ],
              ),

              //SizedBox(height: 20),

              Expanded(child: SizedBox()),

              // чекбокс с напоминанием
              CheckboxListTile(
                title: Text("Напомним за день до визита"),
                value: isChecked,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = newValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),

              Expanded(child: SizedBox()),

              Padding(
                padding: const EdgeInsets.all(18),
                child: (selectedDate != null && selectedTime != null)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: VolvoColors.firstColor,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width - 18,
                          child: const Center(
                            child: Text(
                              'Записаться',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: VolvoColors.firstColor,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - 18,
                        child: const Center(
                          child: Text(
                            'Записаться',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
