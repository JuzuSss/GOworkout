import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:gradient_borders/gradient_borders.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'Tranaction',
            size: 16,
            weight: wsemibold,
            paddingBottom: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimary100,
              border: GradientBoxBorder(gradient: blacktrans(0.3)),
            ),
            child: ListView.builder(
              itemCount: images.length, // Number of items in the list
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    border: GradientBoxBorder(gradient: blacktrans(0.3)),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: AnimatedRow(
                    spacing: 20,
                    children: [
                      CommonImageView(
                        url: images[index],
                        height: 50,
                        width: 50,
                        radius: 200,
                      ),
                      Expanded(
                        child: AnimatedColumn(
                          spacing: 3,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PriceText(
                              info: 'Credit ',
                              title: 'from Tale Simmon',
                              color2: kGrey5Color,
                            ),
                            MyText(text: '23mins ago', color: kGrey5Color),
                          ],
                        ),
                      ),
                      MyText(text: '\$500', paddingBottom: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
