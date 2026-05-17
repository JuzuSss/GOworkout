import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/login.dart';
import 'package:go_workout/view/screens/auth/verify_email.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_check_box.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/media_icon.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class Signup extends StatelessWidget {
  const Signup({super.key, this.iscoach});
  final bool? iscoach;

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
                        title: 'Create an account',
                        subtitle1: 'As a Player,',
                        subtitle2: ' Join us and explore new possibilities!',
                      ),
                      MyTextField(hint: 'Enter Your Email'),
                      MyTextField(hint: 'Enter Your Full Name'),
                      MyTextField(hint: 'Enter Your Age'),
                      MyTextField(
                        hint: 'Enter Your Password',
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 16,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),

                      MyButton(
                        onTap: () {
                          Get.to(() => VerifyEmail(iscoach: iscoach));
                        },
                        buttonText: 'Create account',
                        mTop: 20,
                        mBottom: 16,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            CustomCheckBox(
                              isActive: true,
                              onTap: () {},
                              hasgrad: true,
                              iscircle: true,
                              iconColor: kTertiaryColor,
                              circleIcon: Icons.check,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: TextStyle(
                                      fontFamily: SFPRO,
                                      color: kGrey5Color,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy ',
                                    style: TextStyle(
                                      fontFamily: SFPRO,
                                      color: kSecondaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'and',
                                    style: TextStyle(
                                      fontFamily: SFPRO,
                                      color: kGrey5Color,
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Terms of  Service',
                                    style: TextStyle(
                                      fontFamily: SFPRO,
                                      color: kSecondaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 34),
                      Row(
                        children: [
                          SizedBox(width: 40),
                          Expanded(child: Divider(color: kQuaternaryColor)),
                          MyText(text: 'OR', paddingLeft: 10, paddingRight: 10),
                          Expanded(child: Divider(color: kQuaternaryColor)),
                          SizedBox(width: 40),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MediaIcon(path: Assets.imagesGoogle),
                          MediaIcon(path: Assets.imagesApple),
                        ],
                      ),
                    ],
                  ),
                ),
                AuthRichText(
                  normalText: 'Already have an account ?',
                  tappableText: 'Login',
                  onTap: () {
                    Get.to(() => Login(iscoach: iscoach));
                  },
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
