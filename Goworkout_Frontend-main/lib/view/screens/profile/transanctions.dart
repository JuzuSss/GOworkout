import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/booking/mybokings_body.dart';
import 'package:go_workout/view/screens/profile/trans_details.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Transanctions extends StatelessWidget {
  const Transanctions({super.key});

  @override
  Widget build(BuildContext context) {
    bool hastransanction = true;
    return Scaffold(
      appBar: simpleAppBar(title: 'Transaction'),
      body:
          hastransanction == false
              ? Center(
                child: NoItems(
                  title: 'No Transaction',
                  subtitle: 'You have no transaction history ',

                  path: Assets.imagesNotrans,
                ),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListView.builder(
                          itemCount: images.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          itemBuilder:
                              (context, index) => MoveAnimaate(
                                animateY: true,
                                duration: 300 * index + 200,
                                child: Bounce(
                                  onTap: () {
                                    Get.to(() => TransDetails());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    padding: EdgeInsets.all(13),
                                    decoration: roundedr(kPrimary100, 20),
                                    child: AnimatedRow(
                                      spacing: 16,
                                      children: [
                                        CommonImageView(
                                          url: images[index],
                                          height: 63,
                                          width: 63,
                                          radius: 200,
                                        ),
                                        Expanded(
                                          child: AnimatedColumn(
                                            spacing: 5,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: 'Coach Marcus',
                                                size: 18,
                                                weight: wbold,
                                              ),
                                              MyText(
                                                text: 'Monday, June 25 | 10:00',
                                                size: 13,
                                                color: kGrey5Color,
                                              ),
                                              Row(
                                                children: [
                                                  MyButton(
                                                    height: 22,
                                                    fontSize: 14,
                                                    onTap: () {},
                                                    buttonText: 'Paid',
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            CommonImageView(
                                              imagePath: Assets.imagesRight2,
                                              height: 24,
                                            ),
                                            MyText(
                                              text: '\$25',
                                              color: kSecondaryColor,
                                              size: 18,
                                              weight: wbold,
                                              paddingTop: 30,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
