import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';

import 'package:pinput/pinput.dart';

class MyPinCode extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final Color? color;

  const MyPinCode({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.color,
  });

  @override
  State<MyPinCode> createState() => _MyPinCodeState();
}

class _MyPinCodeState extends State<MyPinCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 78,
      height: 65,
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(0),
      textStyle: TextStyle(
        fontSize: 20,
        color: widget.color ?? kQuaternaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: SFPRO,
      ),
      decoration: BoxDecoration(
        color: ktransparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kGreyColorLight, width: 1.5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: ktransparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kSecondaryColor, width: 1.5),
      ),
    );

    return Pinput(
      length: 4,
      autofillHints: ['---', '---', '---', '---'],
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kQuaternaryColor, width: 1),
        ),
      ),
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
