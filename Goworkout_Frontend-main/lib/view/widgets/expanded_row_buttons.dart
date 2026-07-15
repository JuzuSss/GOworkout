import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';

class ExpandedRowButtons extends StatelessWidget {
  final String? btn1Text; // Text for the first button
  final String? btn2Text; // Text for the second button
  final Color? btn1BackgroundColor; // Background color for the first button
  final Color? btn2BackgroundColor; // Background color for the second button
  final Color? btn1OutlineColor; // Outline color for the first button
  final Color? btn2OutlineColor; // Outline color for the second button
  final Color? btn1FontColor; // Font color for the first button
  final Color? btn2FontColor; // Font color for the second button
  final VoidCallback? btn1OnTap; // Callback for the first button's onTap
  final VoidCallback? btn2OnTap; // Callback for the second button's onTap

  const ExpandedRowButtons({
    super.key,
    this.btn1Text = 'Remove', // Default text for the first button
    this.btn2Text = 'Update', // Default text for the second button
    this.btn1BackgroundColor =
        ktransparent, // Default background color for the first button
    this.btn2BackgroundColor, // Default background color for the second button
    this.btn1OutlineColor =
        kRedColor, // Default outline color for the first button
    this.btn2OutlineColor, // Default outline color for the second button
    this.btn1FontColor = kRedColor, // Default font color for the first button
    this.btn2FontColor, // Default font color for the second button
    this.btn1OnTap, // Optional onTap for the first button
    this.btn2OnTap, // Optional onTap for the second button
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      spacing: 15,
      children: [
        Expanded(
          child: MyButton(
            onTap: btn1OnTap ?? () {}, // Default empty action if not provided
            buttonText: btn1Text ?? 'Remove',
            backgroundColor: btn1BackgroundColor ?? ktransparent,
            outlineColor: btn1OutlineColor ?? kQuaternaryColor,
            fontSize: 14,
            fontWeight: wsemibold,
            fontColor: btn1FontColor ?? kQuaternaryColor,
          ),
        ),
        Expanded(
          child: MyButton(
            onTap: btn2OnTap ?? () {}, // Default empty action if not provided
            buttonText: btn2Text ?? 'Update',
            backgroundColor: btn2BackgroundColor ?? kSecondaryColor,
            outlineColor: btn2OutlineColor ?? kQuaternaryColor,
            isrighticon: false,
            fontSize: 14,
            fontWeight: wsemibold,
            fontColor: btn2FontColor ?? kQuaternaryColor,
          ),
        ),
      ],
    );
  }
}
