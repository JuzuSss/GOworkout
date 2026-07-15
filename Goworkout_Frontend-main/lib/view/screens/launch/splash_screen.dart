import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/launch/onboarding.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(Duration(seconds: 6), () => Get.offAll(() => Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Animate(
          effects: [
            // ShaderEffect(),
            // ShimmerEffect(
            //   color: const Color.fromARGB(112, 255, 255, 255),
            //   duration: Duration(seconds: 1),
            // ),
            // ShimmerEffect(
            //   delay: Duration(seconds: 1),
            //   color: const Color.fromARGB(112, 255, 255, 255),
            //   duration: Duration(seconds: 1),
            // ),
          ],
          child: Container(
            decoration: BoxDecoration(gradient: bggrad()),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.1,
                  child: Animate(
                    effects: [
                      // ShimmerEffect(), ShaderEffect()
                    ],
                    child: CommonImageView(
                      imagePath: Assets.imagesFrame,
                      height: Get.height,
                      width: Get.width,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: CommonImageView(
                      imagePath: Assets.imagesLogo,
                      height: 121,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
