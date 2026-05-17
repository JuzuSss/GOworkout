import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class MyFollowersCoach extends StatelessWidget {
  const MyFollowersCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'My Followers', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  itemCount: images.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: T,
                  itemBuilder:
                      (context, index) => MoveAnimaate(
                        animateY: true,
                        duration: 300 * index + 200,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: roundedr(kPrimary100, 15),
                          child: AnimatedRow(
                            children: [
                              CommonImageView(
                                url: images[index],
                                height: 59,
                                radius: 300,
                                width: 59,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Jordan Rivers',
                                      size: 18,
                                      weight: wbold,
                                    ),
                                    IconTextRow(
                                      padvertical: 5,
                                      iconpath: Assets.imagesMaker,
                                      expanded: false,
                                      iconcolor: kGrey5Color,
                                      iconsize: 14,
                                      text: 'Bronx, New York(NY)',
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  CommonImageView(
                                    imagePath: Assets.imagesMenu3,
                                    height: 24,
                                    width: 24,
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ],
                          ),
                        ),
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
