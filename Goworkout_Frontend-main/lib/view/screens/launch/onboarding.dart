import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/controllers/onboarding_controller.dart';
import 'package:go_workout/view/screens/auth/login.dart';
import 'package:go_workout/view/screens/launch/get_started.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/next_animated_btn.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: Obx(
        () => AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Stack(
            key: ValueKey(controller.currentIndex.value),
            children: [
              CommonImageView(
                imagePath:
                    controller.onboarding[controller
                        .currentIndex
                        .value]["path"]!,
                width: Get.width,
                height: Get.height,
              ),
              AnimatedColumn(
                key: ValueKey(controller.currentIndex.value),
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: CustomRichText(
                        textAlign: TextAlign.center,
                        info:
                            controller.onboarding[controller
                                .currentIndex
                                .value]["title"]!,
                        title:
                            controller.onboarding[controller
                                .currentIndex
                                .value]["subtitle"]!,
                      ),
                    ),
                  ),
                  MyText(
                    text:
                        controller.onboarding[controller
                            .currentIndex
                            .value]["subtxt"]!,
                    size: 16,
                    color: kQuaternaryColor,
                    paddingBottom: 20,
                    paddingLeft: 20,
                    paddingRight: 20,
                    paddingTop: 20,
                    textAlign: TextAlign.center,
                  ),
                  AnimatedNextButton(
                    ontap: () => controller.nextPage(),
                    btnTxt:
                        controller.currentIndex.value ==
                                controller.onboarding.length - 1
                            ? 'Get Started'
                            : 'Next',
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Positioned(
                child: MyText(
                  text: 'Skip',
                  onTap: () {
                    Get.to(() => GetStarted());
                  },
                ),
                top: 40,
                right: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
