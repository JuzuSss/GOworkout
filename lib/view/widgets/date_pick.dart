import 'package:bottom_picker/bottom_picker.dart' show BottomPicker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

void pickdate(BuildContext context, String? title) {
  BottomPicker.date(
    buttonPadding: 0,
    height: Get.height * 0.5,
    titlePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    backgroundColor: kPrimaryColor,
    displayCloseIcon: false,
    displaySubmitButton: true,
    dateOrder: DatePickerDateOrder.dmy,
    dismissable: true,
    // title: 'Select Date',
    pickerTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      fontFamily: SFPRO,
      color: kTertiaryColor,
    ),

    onSubmit: (date) {
      print(date);
    },

    buttonContent: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 48,
        decoration: roundedr(kSecondaryColor, 10),
        child: Center(
          child: MyText(text: 'Done', color: kQuaternaryColor, size: 16),
        ),
      ),
    ),
    buttonWidth: Get.width * 0.9,
    buttonStyle: roundedr(Colors.transparent, 10),
    pickerTitle: MyText(
      text: title ?? 'Start Time',
      size: 20,
      weight: wbold,
      paddingTop: 20,
    ),
  ).show(context);
}
