import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/my_bullet_point.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'About Us', centerTitle: T),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [MovingIcon(path: Assets.imagesBal2, height: 58)],
                ),
                TwoTextedColumn(
                  padVertical: 16,
                  text1: 'About Go Workout',
                  text2: 'Train Smarter. Connect Faster.',
                  size1: 28,
                  size2: 14,
                  weight2: wmedium,
                  color1: kQuaternaryColor,
                  color2: kSecondaryColor,
                ),
                MyText(
                  text:
                      "Go Workout is a mobile platform designed to connect basketball players with professional coaches for private training sessions — anytime, anywhere. Whether you're an aspiring athlete or a seasoned trainer, Go Workout makes it easy to find the perfect match, schedule sessions, and handle everything from chats to payments in one streamlined app.",
                  color: kGrey5Color,
                  paddingBottom: 30,
                  weight: wmedium,
                ),
                MyText(
                  text: '🎯 Our Mission',
                  paddingBottom: 20,
                  size: 16,
                  weight: wmedium,
                ),
                MyText(
                  text:
                      'To empower athletes and coaches by simplifying how they connect, train, and grow — on and off the court.',
                  color: kGrey5Color,

                  paddingBottom: 30,
                ),
                MyText(
                  text: '👥 Who We Serve',
                  size: 16,
                  weight: wmedium,
                  paddingBottom: 20,
                ),
                MyBullet(
                  point:
                      'Players looking to level up their game with personalized coaching',
                  size: 16,
                ),
                MyBullet(
                  point:
                      'Coaches who want to manage sessions, build credibility, and earn securely',
                  size: 16,
                ),
                MyBullet(
                  point:
                      'Communities that believe in the power of sports to inspire and unite',
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
