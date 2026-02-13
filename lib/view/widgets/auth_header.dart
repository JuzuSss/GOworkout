import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final Color? color1, color2;
  final double? space, space2;
  const AuthHeader({
    Key? key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    this.color1,
    this.color2,
    this.space,
    this.space2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title,
          size: 28,
          weight: FontWeight.bold,
          paddingTop: space2 ?? 100,
        ),
        PriceText(
          info: subtitle1,
          title: subtitle2,
          color: color1 ?? kSecondaryColor,
          color2: color2 ?? kGrey5Color,
        ),
        SizedBox(height: space ?? 34),
      ],
    );
  }
}
