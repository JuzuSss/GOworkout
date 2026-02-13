import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/foget_password.dart';
import 'package:go_workout/view/screens/auth/signup.dart';
import 'package:go_workout/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:go_workout/view/screens/bottom_nav_bar/bottom_nav_coach.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/media_icon.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key, this.iscoach = false});
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
                        title: 'Welcome Back!',
                        subtitle1: 'Log in',
                        subtitle2:
                            ' to book sessions, manage your schedule, and connect with your basketball community.',
                      ),
                      MyTextField(hint: 'Enter Your Email'),
                      MyTextField(
                        hint: 'Enter Your Password',
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 16,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                      MyText(
                        onTap: () {
                          Get.to(() => ForgetPassword());
                        },
                        text: 'Forget Password',
                        color: kGreyColor,
                        textAlign: TextAlign.end,
                      ),
                      MyButton(
                        onTap: () {
                          if (iscoach == true) {
                            Get.to(() => BottomNavCoach());
                          } else {
                            Get.to(() => BottomNavBar());
                          }
                        },
                        buttonText: 'Login',
                        mTop: 20,
                        mBottom: 34,
                      ),
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
                  normalText: 'Don’t have an account ?',
                  tappableText: 'Create Account',
                  onTap: () {
                    if (iscoach == false) {
                      Get.to(() => Signup());
                    } else {
                      Get.to(() => Signup(iscoach: true));
                    }
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
