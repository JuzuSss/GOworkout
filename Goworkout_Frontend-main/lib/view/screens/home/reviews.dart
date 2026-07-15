import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_bottom_sheet.dart';
import 'package:go_workout/view/widgets/custom_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_ratings.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Reviews extends StatelessWidget {
  final bool? iscoach;
  const Reviews({super.key, this.iscoach});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.DEFAULT,
      child: ListView(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        children: [
          MyText(text: 'Overall Ratings', size: 16, paddingBottom: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: circle(Colors.white, kQuaternaryColor),
                          child: Center(
                            child: MyText(
                              text: '4.7',
                              size: 20,
                              weight: wbold,
                              color: kTertiaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    StarRating(rating: 4.5),
                    MyText(text: '126 Reviews', size: 12, paddingLeft: 4),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  spacing: 5,
                  children: [
                    for (int i = 5; i > 0; i--)
                      Row(
                        children: [
                          MyText(text: '$i', color: kGrey5Color),
                          CommonImageView(
                            imagePath: Assets.imagesStar,
                            height: 24,
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              lineHeight: 8,
                              barRadius: Radius.circular(20),
                              percent:
                                  i == 1
                                      ? 0.2
                                      : i == 2
                                      ? 0.1
                                      : i == 3
                                      ? 0.4
                                      : 0.8,
                              animation: true,
                              progressColor: kYellowColor,
                            ),
                          ),
                          MyText(text: '100'),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          CustomRow(
            left: 'Reviews',
            right: '',
            padends: 0,
            hasRight: iscoach == true ? T : F,
            weightleft: wsemibold,
            sizeleft: 16,
            rightIcon: MyText(
              onTap: () {
                Get.bottomSheet(
                  AddReview(),
                  isScrollControlled: true,
                  barrierColor: kGrey5Color.withOpacity(0.2),
                );
              },
              text: 'Add a review',
              decoration: TextDecoration.underline,
              color: kSecondaryColor,
              size: 16,
            ),
          ),
          ListView.builder(
            itemCount: images.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            itemBuilder:
                (context, index) => Column(
                  spacing: 10,
                  children: [
                    IconTitleSubtitle(
                      path: images[index],
                      iconheight: 40,
                      subtitle: 'Jakarta',
                      color2: kGrey5Color,
                      hastsubtitle: T,
                      trailing: AnimatedColumn(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              CommonImageView(
                                imagePath: Assets.imagesStar,
                                height: 14,
                              ),
                              MyText(text: '5/5', color: kGrey5Color, size: 12),
                            ],
                          ),
                          MyText(
                            text: 'Excellent Coach',
                            size: 12,
                            color: kGrey5Color,
                          ),
                        ],
                      ),
                      isurl: true,
                      iconRadis: 200,
                      title: 'Courtney Henry',
                    ),
                    MyText(
                      color: kGrey5Color,
                      text:
                          'Coach Thompson prioritizes his players development, ensuring they receive the guidance and support necessary to excel on and off the court.',
                    ),
                    Divider(color: kPrimary100),
                    SizedBox(height: 10),
                  ],
                ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class AddReview extends StatelessWidget {
  const AddReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      bgcolor: kPrimaryColor,
      padends: 0,
      children: [
        Padding(
          padding: AppSizes.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonImageView(imagePath: Assets.imagesClose, height: 24),
              MyText(text: 'Add a review', weight: wmedium, size: 18),
              SizedBox(width: 24),
            ],
          ),
        ),
        Divider(color: kPrimary100, height: 0),
        MyText(
          text: 'How was your experience',
          size: 16,
          paddingLeft: 20,
          paddingBottom: 20,
          paddingTop: 16,
        ),
        Center(child: StarRating(rating: 0, padEnds: 8)),
        SizedBox(height: 30),
        Padding(
          padding: AppSizes.HORIZONTAL,
          child: MyTextField(
            label: 'Write a comment',
            labelColor: kQuaternaryColor,
            labelWeight: wregular,
            focusedLabelColor: kQuaternaryColor,
            radius: 12,
            filledColor: kPrimary100,
            bordercolor: kPrimary100,
            maxLines: 6,
            suffixIcon: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [MyText(text: 'Max 250 words')],
              ),
            ),
          ),
        ),
        MyButton(
          onTap: () {},
          buttonText: 'Submit Review',
          backgroundColor: kQuaternaryColor,
          fontColor: kTertiaryColor,
          mhoriz: 20,
          mBottom: 20,
        ),
      ],
    );
  }
}
