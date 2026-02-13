import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/login.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ktransparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Animate(
                      effects: [
                        // ShimmerEffect(
                        //   color: kQuaternaryColor.withOpacity(0.5),
                        //   delay: Duration(milliseconds: 500),
                        //   duration: Duration(milliseconds: 500),
                        // ),
                      ],
                      child: CommonImageView(
                        imagePath: Assets.imagesPlayer,
                        width: Get.width,
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      right: 40,
                      left: 40,
                      child: MyButton(
                        height: 65,
                        onTap: () {
                          Get.to(() => Login());
                        },
                        buttonText: 'Sign Up As Player',
                        hasicon: true,
                        radius: 100,
                        isrighticon: true,
                        choiceIcon: Assets.imagesRight,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: const Color.fromRGBO(250, 75, 3, 1),
                      child: Animate(
                        effects: [
                          // ShimmerEffect(
                          //   color: kQuaternaryColor.withOpacity(0.5),
                          //   delay: Duration(milliseconds: 1000),
                          //   duration: Duration(milliseconds: 1000),
                          //   angle: 0.5,
                          // ),
                        ],
                        child: CommonImageView(imagePath: Assets.imagesCoach),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      right: 40,
                      left: 40,
                      child: MyButton(
                        height: 65,
                        backgroundColor: kQuaternaryColor,
                        fontColor: kTertiaryColor,

                        onTap: () {
                          Get.to(() => Login(iscoach: true));
                        },
                        buttonText: 'Sign Up As Coach',
                        hasicon: true,
                        radius: 100,
                        iconcolor: kTertiaryColor,
                        isrighticon: true,

                        choiceIcon: Assets.imagesRight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                textAlign: TextAlign.center,
                text: 'Let’s Get Started',
                size: 32,
                paddingTop: 28,
                color: kQuaternaryColor,
                weight: wbold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
