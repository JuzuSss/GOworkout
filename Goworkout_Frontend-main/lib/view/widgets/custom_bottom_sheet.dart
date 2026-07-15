import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/animated_column.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.children,
    this.padends,
    this.height,
    this.bgcolor,
  });
  final List<Widget> children;
  final double? padends, height;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      padding: EdgeInsets.all(padends ?? 20),
      decoration: BoxDecoration(
        color: bgcolor ?? kPrimary100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: AnimatedColumn(
        mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   decoration: rounded2(kBorderColor, kBorderColor),
          //   height: 4,
          //   width: 80,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ],
      ),
    );
  }
}
