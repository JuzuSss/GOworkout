import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.left,
    this.padends,
    required this.right,
    this.colorLeft,
    this.colorRight,
    this.sizeleft,
    this.sizeright,
    this.hasRight = true,
    this.rightIcon,
    this.weightleft,
    this.padvertical,
    this.weightright,
    this.onrighttap,
  });
  final String left, right;
  final Color? colorLeft, colorRight;
  final double? sizeleft, sizeright, padends, padvertical;
  final FontWeight? weightleft, weightright;
  final bool? hasRight;
  final Widget? rightIcon;
  final VoidCallback? onrighttap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: padvertical ?? 20,
        horizontal: padends ?? 20,
      ),
      child: AnimatedRow(
        children: [
          Expanded(
            child: MyText(
              text: left,
              size: sizeleft ?? 16,
              color: colorLeft ?? kQuaternaryColor,
              weight: weightleft ?? FontWeight.w400,
            ),
          ),
          hasRight == false
              ? Bounce(
                onTap: onrighttap ?? () {},
                child:
                    rightIcon ??
                    CommonImageView(
                      //  imagePath: Assets.imagesOnboard1,
                      height: 20,
                    ),
              )
              : MyText(
                text: right,
                onTap: onrighttap ?? () {},
                color: colorRight ?? kQuaternaryColor,
                size: sizeright ?? 16,
                weight: weightright ?? FontWeight.w400,
              ),
        ],
      ),
    );
  }
}
