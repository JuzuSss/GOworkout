import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:flutter/material.dart';

class RichtextCustom extends StatelessWidget {
  final String currency;
  final String txt1;
  final String? txt2;
  final Color? txt1Color, optioncolor;
  final Color? txt2Color;
  final double? priceSize, txt1size;
  final double? txt2Size;
  final FontWeight? weight1, weight2;
  final TextDecoration? txt2Decoration;
  final VoidCallback? ontaptxt2;
  final MainAxisAlignment? textAlign;
  const RichtextCustom({
    super.key,
    this.currency = 'AED',
    required this.txt1,
    this.txt2,

    this.txt1Color,
    this.txt2Color,
    this.priceSize = 14,
    this.txt2Size = 14,
    this.txt2Decoration = TextDecoration.lineThrough,
    this.txt1size,
    this.optioncolor,
    this.ontaptxt2,
    this.textAlign,
    this.weight1,
    this.weight2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: textAlign ?? MainAxisAlignment.center,
      children: [
        PriceText(
          info: '',
          title: txt1,
          fontWeight: weight1 ?? FontWeight.normal,
          size2: txt2Size!,
          size1: txt1size ?? 14,
          color2: txt1Color ?? kSecondaryBlue,
          color: txt1Color ?? kSecondaryBlue,
        ),
        if (txt2 != null) // Show old price only if it's provided
          MyText(
            text: txt2!,
            color: txt2Color ?? kGreyColor,
            //  decoration: txt2Decoration ?? TextDecoration.lineThrough,
            size: txt2Size!,
            paddingLeft: 3,
            weight: weight2 ?? FontWeight.bold,
            onTap: ontaptxt2 ?? () {},
          ),
      ],
    );
  }
}
