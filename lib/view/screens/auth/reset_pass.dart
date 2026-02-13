import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBallStack(),
          Scaffold(
            backgroundColor: ktransparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      AuthHeader(
                        title: 'Reset Password',
                        color1: kGrey5Color,
                        color2: kSecondaryColor,
                        subtitle1: 'Enter your new ',
                        subtitle2: 'password',
                        space: 0,
                      ),
                      MyText(
                        text: 'below and your password will be reset',
                        color: kGrey5Color,
                        size: 12,
                        paddingBottom: 34,
                      ),
                      MyTextField(
                        hint: 'New Password',
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 16,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                      MyTextField(
                        hint: 'Confirm Password',
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 24,
                        ),
                      ),
                      MyButton(onTap: () {}, buttonText: 'Update Password'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
