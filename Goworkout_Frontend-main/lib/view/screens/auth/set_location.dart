import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/manual_location.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesLocation,
                      height: 64,
                    ),
                  ],
                ),
                AuthHeader(
                  color1: kGrey5Color,
                  color2: kSecondaryColor,
                  title: 'Hello, nice to meet\nyou!',
                  subtitle1: 'Set your location to start find Basketball ',
                  subtitle2: '\ncoaches around you',
                  space: 122,
                  space2: 20,
                ),
                MyButton(
                  onTap: () {},
                  buttonText: 'Use Current Loction',
                  hasicon: true,
                  choiceIcon: Assets.imagesArrow,
                  mBottom: 10,
                ),
                MyText(
                  text:
                      'We only access your location while you are using this incredible app',
                  color: kGrey5Color,
                  size: 13,
                  paddingBottom: 40,
                ),
                MyText(
                  onTap: () {
                    Get.to(
                      () => ManualLocation(),
                      transition: Transition.downToUp,
                      duration: Duration(milliseconds: 600),
                    );
                  },
                  text: 'or set your location manually',
                  decoration: TextDecoration.underline,
                  color: kQuaternaryColor,
                  textAlign: TextAlign.center,
                  size: 17,
                  weight: wmedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
