import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:volvo_app/car_details/components/constants.dart';
import 'package:volvo_app/test_drive_form/test_drive_form_view_model.dart';

class TestDriveFormView extends StatefulWidget {
  final BuildContext ctx;
  final String carModel;

  TestDriveFormView({
    required this.ctx,
    required this.carModel,
  });

  @override
  State<TestDriveFormView> createState() => _TestDriveFormViewState();
}

class _TestDriveFormViewState extends State<TestDriveFormView> {
  final _formKey = GlobalKey<FormState>();

  late TestDriveData data;

  @override
  Widget build(BuildContext context) {
    data = TestDriveData(
      mail: '',
      name: '',
      phone: 0,
      surname: '',
      town: '',
      carModel: widget.carModel,
    );
    void _trySubmit() {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        _formKey.currentState!.save();
        final testDriveData = Provider.of<TestDriveViewModel>(
          context,
          listen: false,
        );
        testDriveData.setData(data);
        Navigator.pop(context);
      }
    }

    final size = MediaQuery.of(widget.ctx).size;
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
          child: Form(
            key: _formKey,
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
                Text(
                  widget.carModel,
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
                CustomTextField(
                    keyboardType: TextInputType.name,
                    hintText: 'Введите фамилию',
                    setValue: (value) {
                      data.surname = value;
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    keyboardType: TextInputType.name,
                    hintText: 'Введите имя',
                    setValue: (value) {
                      data.name = value;
                    }),
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
                CustomTextField(
                    keyboardType: TextInputType.text,
                    hintText: 'Введите город',
                    setValue: (value) {
                      data.town = value;
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    hintText: 'Введите телефон',
                    setValue: (value) {
                      data.phone = int.parse(value);
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Введите почту',
                    setValue: (value) {
                      data.mail = value;
                    }),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    _trySubmit();
                  },
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function setValue;
  final keyboardType;

  // ignore: use_key_in_widget_constructors
  const CustomTextField({
    required this.hintText,
    required this.setValue,
    required this.keyboardType,
  });

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
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: (value) => {
          setValue(value == null ? '' : value.trim()),
        },
        validator: (value) {
          if (value != null && value.length > 4) {
            return;
          }
        },
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




  // Future<dynamic> CarSeriesModalBottomSheet(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       return FractionallySizedBox(
  //         heightFactor: 0.92,
  //         child: Container(
  //           padding: EdgeInsets.only(
  //             bottom: MediaQuery.of(context).viewInsets.bottom,
  //           ),
  //           width: MediaQuery.of(context).size.width,
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(40.0),
  //               topRight: Radius.circular(40.0),
  //             ),
  //           ),
  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 56),
  //                   child: SvgPicture.asset(
  //                     'assets/icons/volvo_logo.svg',
  //                     height: 16,
  //                   ),
  //                 ),
  //                 const SizedBox(height: 11),
  //                 const Text(
  //                   'XC серия',
  //                   style: TextStyle(
  //                     color: Color(0xFF555F66),
  //                     fontSize: 14,
  //                     fontFamily: 'VolvoNovum',
  //                   ),
  //                 ),
  //                 const SizedBox(height: 40),
  //                 const SizedBox(height: 16),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }