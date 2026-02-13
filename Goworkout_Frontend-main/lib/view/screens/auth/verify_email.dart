import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/profile_setup.dart';
import 'package:go_workout/view/screens/auth/reset_pass.dart';
import 'package:go_workout/view/screens/auth/coach_setup/setup_profile_coach.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/custom_bottom_sheet.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_pin_code.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.isforget, this.iscoach});
  final bool? iscoach;
  final bool? isforget;
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
                        title: 'Verify Email',
                        subtitle1: 'We’re Send you The Verification Code on',
                        subtitle2: '\nacbd@xyz.com',
                        color1: kGrey5Color,
                        color2: kSecondaryColor,
                      ),
                      MyPinCode(onChanged: (v) {}, onCompleted: (v) {}),
                      MyButton(
                        onTap: () {
                          if (isforget == true) {
                            Get.to(() => ResetPass());
                          } else {
                            Get.bottomSheet(
                              EmailVerified(iscoach: iscoach),
                              isScrollControlled: true,
                            );
                          }
                        },
                        buttonText: 'Verify Code',
                        mTop: 20,
                        mBottom: 34,
                      ),
                      AuthRichText(
                        normalText: 'Resend Code? in',
                        tappableText: '00:30',
                        normalColor: kQuaternaryColor,
                        onTap: () {
                          // Get.to(() => Signup());
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmailVerified extends StatelessWidget {
  const EmailVerified({super.key, this.iscoach});
  final bool? iscoach;

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      children: [
        MovingIcon(path: Assets.imagesBootmdone, height: 210),
        MyText(
          text: 'Yey! Email Verified Successful',
          size: 28,
          weight: wbold,
          textAlign: TextAlign.center,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'You will be moved to home screen right now. Enjoy the features!',
          textAlign: TextAlign.center,
          color: kGrey5Color,
          paddingBottom: 20,
        ),
        MyButton(
          onTap: () {
            if (iscoach == true) {
              Get.to(() => SetupProfileCoach());
            } else {
              Get.to(() => ProfileSetup());
            }
          },
          buttonText: 'Profile Step-up',
          mBottom: 20,
        ),
        MyButton(
          onTap: () {},
          buttonText: 'Skip for now',
          backgroundColor: kPrimaryColor,
          outlineColor: kGrey5Color,
          mBottom: 20,
        ),
      ],
    );
  }
}
