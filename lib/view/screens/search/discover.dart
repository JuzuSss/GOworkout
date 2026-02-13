import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_ratings.dart';
import 'package:go_workout/view/widgets/title_row.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleRow(title: 'Suggestions', padends: 0),
                  SizedBox(height: 10),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder:
                        (context, index) => MoveAnimaate(
                          duration: (300 * index) + 200,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: IconTitleSubtitle(
                              isurl: true,
                              path: dummyImage,
                              iconheight: 72,
                              iconRadis: 200,
                              rowspace: 10,
                              title: 'Barbara Haque',
                              subtitle: 'Available Today',
                              subtitle2: '22+ Sessions',
                              hasthirdtext: true,
                              hastsubtitle: true,
                              size1: 16,
                              color2: kGrey5Color,
                              decoration: rounded2(kPrimary100, kPrimary100),
                              padEnds: 10,
                              trailing: Column(
                                spacing: 10,
                                //      crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RatingText(hasviews: false, size: 13),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 2,
                                    ),
                                    decoration: roundedr(kSecondaryColor, 100),
                                    child: PriceText(
                                      info: '\$21',
                                      title: '/hr',
                                      color2: kQuaternaryColor,
                                      fontWeight2: wbold,
                                      fontWeight: wlight,
                                      size1: 20,
                                      color: kQuaternaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              padVertical: 10,
                            ),
                          ),
                        ),
                  ),
                  TitleRow(title: 'Map', padends: 0, seealltxt: 'Open'),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      CommonImageView(
                        imagePath: Assets.imagesMap,
                        radius: 10,
                        width: Get.width,
                        height: 325,
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Stack(
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesMap2,
                                height: 70,
                              ),
                              Positioned(
                                top: 4,
                                left: 4,
                                child: CommonImageView(
                                  url: dummyImage,
                                  height: 50,
                                  width: 50,
                                  radius: 200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
