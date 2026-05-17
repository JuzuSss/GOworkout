import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_styling.dart';

class InputQuantity extends StatelessWidget {
  const InputQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        decoration: rounded2(ktransparent, kGreyColorLight),
        child: InputQty(
          qtyFormProps: QtyFormProps(
            style: TextStyle(
              fontFamily: SFPRO,
              fontWeight: FontWeight.w600,
              color: kBlack2Color,
              fontSize: 11,
            ),
          ),
          initVal: 01,
          minVal: 0,
          maxVal: 100,
          decoration: QtyDecorationProps(
            minusBtn: Container(
              height: 28,
              width: 28,
              color: kGreyColorLight,
              child: Icon(Icons.remove, size: 18, color: kGreyColor),
            ),
            plusBtn: Container(
              height: 28,
              width: 28,
              color: kQuaternaryColor,
              child: Icon(Icons.add, size: 18, color: kSecondaryColor),
            ),
            isBordered: false,
            btnColor: kSecondaryColor,
            width: 12,
          ),
        ),
      ),
    );
  }
}
