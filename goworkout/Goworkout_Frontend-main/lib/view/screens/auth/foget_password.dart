import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/constants.dart';
import 'package:go_workout/view/screens/auth/verify_email.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                      MyText(
                        text: 'Forgot Password?',
                        size: 28,
                        weight: FontWeight.bold,
                        paddingTop: 100,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Enter your ',
                              style: simpletxtStyle,
                            ),
                            TextSpan(
                              text: 'email address ',
                              style: secondarytxtstyle,
                            ),
                            TextSpan(
                              text:
                                  'below\nand we’ll send you a link with instructions',
                              style: simpletxtStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 75),
                      MyTextField(hint: 'Enter Your Email'),
                      MyButton(
                        onTap: () {
                          Get.to(() => VerifyEmail(isforget: true));
                        },
                        buttonText: 'Send Verification Code',
                      ),
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
