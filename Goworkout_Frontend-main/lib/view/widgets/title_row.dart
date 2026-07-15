import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    super.key,
    this.hasseeall = true,
    this.title,
    this.onseeallTap,
    this.padends,
    this.seealltxt,
  });
  final bool? hasseeall;
  final String? title, seealltxt;
  final double? padends;
  final VoidCallback? onseeallTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      children: [
        MyText(
          text: title ?? 'All Services',
          paddingLeft: padends ?? 9,
          size: 20,
          weight: FontWeight.w400,
        ),
        Spacer(),
        if (hasseeall == true)
          Bounce(
            onTap: onseeallTap ?? () {},
            duration: Duration(milliseconds: 200),
            child: Row(
              children: [
                MyText(
                  text: seealltxt ?? 'See all',
                  color: kSecondaryColor,
                  size: 11,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: kSecondaryColor,
                  size: 14,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
