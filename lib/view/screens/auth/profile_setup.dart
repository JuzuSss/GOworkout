import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/constants/constants.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/auth/set_location.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_drop_down.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

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
                        text: 'Set Your Profile',
                        size: 28,
                        weight: FontWeight.bold,
                        paddingTop: 100,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Set up your profile and showcase your skill level ',
                              style: simpletxtStyle,
                            ),
                            TextSpan(
                              text: ' skill level',
                              style: secondarytxtstyle,
                            ),
                            TextSpan(
                              text: 'and photo to start connecting',
                              style: simpletxtStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 48),
                      PhotoStack(),
                      MyText(
                        text: 'Upload Your Photo',
                        textAlign: TextAlign.center,
                        size: 18,
                        weight: wmedium,
                        paddingTop: 10,
                      ),
                      CustomDropDown(
                        hint: "Select Player Level",
                        heading: '',
                        items: ['Departmental', 'Regional', 'National'],
                        onChanged: (v) {},
                      ),
                      MyButton(
                        onTap: () {
                          Get.to(() => SetLocation());
                        },
                        buttonText: 'Save Changes',
                        mTop: 20,
                        mBottom: 34,
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

class PhotoStack extends StatelessWidget {
  final bool? isattach;
  const PhotoStack({super.key, this.isattach});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          isattach == true
              ? CommonImageView(
                url: images[7],
                height: 135,
                width: 135,
                radius: 300,
              )
              : Container(
                decoration: circle(kGrey3Color, kGrey3Color),
                height: 135,
                width: 135,
              ),
          Positioned(
            child: CommonImageView(imagePath: Assets.imagesCamera, height: 56),
            bottom: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
