import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';

// ignore: must_be_immutable
class CustomRichText extends StatelessWidget {
  final String info;
  final String title;
  TextStyle? firstTextStyle;
  TextStyle? secondTextStyle;
  final void Function()? ontaptext;
  final TextAlign? textAlign;
  CustomRichText({
    super.key,
    required this.info,
    required this.title,
    this.firstTextStyle,
    this.secondTextStyle,
    this.ontaptext,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        text: '$info ',
        style:
            firstTextStyle ??
            theme.textTheme.bodyLarge?.copyWith(
              fontSize: 32,
              fontFamily: SFPRO,
              fontWeight: FontWeight.w700,
              color: kQuaternaryColor,
            ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = ontaptext ?? () {},
            text: ' $title',
            style:
                secondTextStyle ??
                theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                  fontFamily: SFPRO,
                  fontSize: 32,
                ),
          ),
        ],
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  final String info;
  final String title;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;
  final TextAlign? textAlign;

  // Constructor with default values for size1, size2, and color
  PriceText({
    required this.info,
    required this.title,
    double? size1,
    double? size2,
    Color? color,
    color2,
    FontWeight? fontWeight,
    fontWeight2,
    this.textAlign,
  }) : firstTextStyle = TextStyle(
         fontFamily: SFPRO,
         fontWeight: fontWeight2 ?? FontWeight.w500,
         fontSize: size1 ?? 14, // Default to 10 if size1 is not provided
         color:
             color ??
             kSecondaryColor, // Default to kSecondaryColor if color is not provided
       ),
       secondTextStyle = TextStyle(
         fontFamily: SFPRO,
         fontSize: size2 ?? 14, // Default to 12 if size2 is not provided
         fontWeight:
             fontWeight ??
             FontWeight.w500, // Default to w700 if no fontWeight is provided
         color:
             color2 ??
             kGrey5Color, // Default to kSecondaryColor if color is not provided
       );

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(text: info, style: firstTextStyle),
          TextSpan(text: title, style: secondTextStyle),
        ],
      ),
    );
  }
}

class AuthRichText extends StatelessWidget {
  final String normalText;
  final String tappableText;
  final VoidCallback onTap;
  final Color normalColor;
  final Color tappableColor;
  final double fontSize;

  const AuthRichText({
    Key? key,
    required this.normalText,
    required this.tappableText,
    required this.onTap,
    this.normalColor = kGrey5Color,
    this.tappableColor = kSecondaryColor,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$normalText ",
            style: TextStyle(color: normalColor, fontSize: fontSize),
          ),
          TextSpan(
            text: tappableText,
            style: TextStyle(
              color: tappableColor,
              fontFamily: SFPRO,
              fontSize: fontSize,
              decorationColor: kSecondaryColor,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.normal,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
