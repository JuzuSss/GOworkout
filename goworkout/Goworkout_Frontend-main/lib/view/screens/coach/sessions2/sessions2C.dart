import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/home/location.dart';
import 'package:go_workout/view/screens/home/reviews.dart';
import 'package:go_workout/view/screens/coach/sessions2/my_followers_coach.dart';
import 'package:go_workout/view/screens/coach/sessions2/sessions_coach.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_ratings.dart';
import 'package:go_workout/view/widgets/tabs_widget.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Sessions2c extends StatelessWidget {
  const Sessions2c({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: kPrimaryColor,
                expandedHeight: 273,
                iconTheme: IconThemeData(color: ktransparent),

                actions: [
                  CommonImageView(imagePath: Assets.imagesMenu2, height: 24),
                  SizedBox(width: 20),
                ],
                shadowColor: kPrimaryColor,
                foregroundColor: kPrimaryColor,
                surfaceTintColor: ktransparent,

                centerTitle: true,
                leadingWidth: 66,
                leading: Row(
                  children: [
                    SizedBox(width: 16),
                    Image.asset(Assets.imagesMenu, height: 24),
                    // searchwidget ?? Container(),
                  ],
                ),

                floating: true,
                pinned: true,
                shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(30),
                  //   bottomLeft: Radius.circular(30),
                  // ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(0, 90),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border(bottom: BorderSide(color: kPrimary100)),
                    ),

                    child: MyTabbar(
                      padEnds: 0,
                      indicatorPads: 0,
                      items: ['Session', 'Location', "Reviews"],
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                  ),
                                  child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                      sigmaX: 5,
                                      sigmaY: 5,
                                    ),
                                    child: CommonImageView(
                                      height: Get.height,
                                      width: Get.width,
                                      url:
                                          'https://images.unsplash.com/photo-1544972917-3529b113a469?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: roundedr(
                                      kTertiaryColor.withOpacity(0.3),
                                      20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: AppSizes.DEFAULT,
                            child: AnimatedColumn(
                              spacing: 20,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: circle(
                                            kQuaternaryColor,
                                            kQuaternaryColor,
                                          ),
                                          height: 87,
                                          width: 87,
                                        ),
                                        Positioned(
                                          right: 0.7,
                                          bottom: 0.7,
                                          child: CommonImageView(
                                            url: images[7],
                                            height: 87,
                                            width: 87,
                                            radius: 200,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          TwoTextedColumn(
                                            color2: kGreyColorLight,
                                            text1: 'Barbara Haque',
                                            text2:
                                                'A passionate basketball coach with over a decade of experience.',
                                          ),
                                          RatingText(hasviews: false, size: 14),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TwoTextedColumn(
                                      text1: '65',

                                      text2: 'Reviews',
                                      size1: 16,
                                      size2: 13,
                                      alignment: ColumnAlignment.center,
                                      weight1: wmedium,
                                    ),
                                    TwoTextedColumn(
                                      text1: '200+',
                                      text2: 'Sessions',
                                      size1: 16,
                                      size2: 13,
                                      alignment: ColumnAlignment.center,
                                      weight1: wmedium,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => MyFollowersCoach());
                                      },
                                      child: TwoTextedColumn(
                                        color1: kQuaternaryColor,
                                        text1: '12.1K',
                                        text2: 'Followers',
                                        size1: 16,
                                        size2: 13,
                                        alignment: ColumnAlignment.center,
                                        weight1: wmedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SessionsCoach(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Location(),
                  MyButton(
                    onTap: () {},
                    buttonText: 'Update Location',
                    backgroundColor: ktransparent,
                    outlineColor: kQuaternaryColor,
                    mhoriz: 20,
                  ),
                ],
              ),
              Reviews(iscoach: true),
            ],
          ),
        ),
      ),
    );
  }
}
