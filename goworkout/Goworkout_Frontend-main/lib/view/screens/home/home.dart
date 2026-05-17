import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/utils.dart';

import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/home/search_filter.dart';
import 'package:go_workout/view/screens/notifications/notifications.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/title_row.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                  TitleRow(title: 'Top Coaches'),
                  SizedBox(height: 10),
                  ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: images.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder:
                        (context, index) => MoveAnimaate(
                          duration: (300 * index) + 200,
                          child: CoachTile(path: images[index]),
                        ),
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

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, this.isfexiblespace = T});
  final bool? isfexiblespace;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimary100,
      expandedHeight: isfexiblespace == false ? 70 : 223,
      iconTheme: IconThemeData(color: ktransparent),

      actions: [
        Bounce(
          onTap: () {
            Get.to(() => Notifications());
          },
          child: CommonImageView(imagePath: Assets.imagesNotify, height: 24),
        ),

        SizedBox(width: 20),
      ],
      shadowColor: kPrimaryColor,
      foregroundColor: kPrimaryColor,
      surfaceTintColor: kPrimaryColor,
      centerTitle: true,
      leadingWidth: 66,
      leading: Row(
        children: [
          SizedBox(width: 16),
          GestureDetector(child: Image.asset(Assets.imagesMenu, height: 24)),
          // searchwidget ?? Container(),
        ],
      ),

      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImageView(imagePath: Assets.imagesLocation2, height: 18),
          MyText(
            // paddingLeft: 16,
            paddingTop: 30,
            text: 'NY, USA',
            size: 14,
            lineHeight: 2,
            decoration: TextDecoration.underline,
            color: kQuaternaryColor,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            weight: FontWeight.w500,
            paddingBottom: 30,
          ),
        ],
      ),
      floating: true,
      pinned: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      flexibleSpace:
          isfexiblespace == false
              ? null
              : FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(0),
                  child: SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: AppSizes.DEFAULT,
                          child: AnimatedColumn(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TwoTextedColumn(
                                text1: 'Hey Mike!',
                                text2: 'Find your favorit basketball coach!',
                              ),
                              MyTextField(
                                filledColor: kQuaternaryColor.withOpacity(0.33),
                                hint: 'Search..',
                                hintColor: kGrey1Color,
                                prefixIcon: CommonImageView(
                                  imagePath: Assets.imagesSearch,
                                  height: 20,
                                  fit: BoxFit.contain,
                                  width: 29,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      SearchFilter(),
                                      barrierColor: kPrimary100.withOpacity(
                                        0.6,
                                      ),
                                      isScrollControlled: true,
                                    );
                                  },
                                  child: CommonImageView(
                                    imagePath: Assets.imagesFilter,
                                    //   height: 24,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    width: 29,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -70,
                          right: -90,
                          child: CommonImageView(
                            imagePath: Assets.imagesBall,
                            height: 200,
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
