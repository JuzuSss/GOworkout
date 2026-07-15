import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class WidgetTextRow extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight textWeight;
  final Widget? child;
  final double imageHeight;
  final VoidCallback? onTap;
  final bool? flipX;
  const WidgetTextRow({
    Key? key,
    required this.text,
    this.textSize = 16,
    this.textWeight = FontWeight.w500,
    this.child,
    this.imageHeight = 24,
    this.onTap,
    this.flipX,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flipX == true
        ? AnimatedRow(
          children: [
            GestureDetector(onTap: onTap, child: child ?? SizedBox()),
            Expanded(
              child: MyText(
                text: text.tr,
                size: textSize,
                weight: textWeight,
                color: kGreyColor,
              ),
            ),
          ],
        )
        : AnimatedRow(
          children: [
            MyText(
              text: text.tr,
              size: textSize,
              weight: textWeight,
              color: kGreyColor,
            ),
            Expanded(
              child: GestureDetector(onTap: onTap, child: child ?? SizedBox()),
            ),
          ],
        );
  }
}
