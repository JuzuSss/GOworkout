import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TwoTextedColumn(
          size1: 16,
          weight1: wmedium,
          padEnds: 20,
          padVertical: 10,
          space: 5,

          text1: 'Current Location',
          text2: 'Lafayette St &, E Houston St, New York, 10012, United States',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            spacing: 20,
            children: [
              AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: 'Distance', color: kGrey5Color),
                  PriceText(
                    info: '10:23',
                    title: ' km',
                    color: kQuaternaryColor,
                  ),
                ],
              ),
              AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: 'Time', color: kGrey5Color),
                  PriceText(
                    info: '10:23',
                    title: ' km',
                    color: kQuaternaryColor,
                  ),
                ],
              ),
              Spacer(),
              CommonImageView(svgPath: Assets.imagesSend2, height: 40),
            ],
          ),
        ),
        Padding(
          padding: AppSizes.DEFAULT,
          child: CommonImageView(imagePath: Assets.imagesMap, height: 200),
        ),
      ],
    );
  }
}
