import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/constants/constants.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:super_tooltip/super_tooltip.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Details',
        centerTitle: T,
        actions: [
          CommonImageView(imagePath: Assets.imagesEdit2, height: 24),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'Session Details',
                  size: 16,
                  weight: wmedium,
                  paddingBottom: 20,
                ),
                AnimatedRow(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: MyTextField(
                        filledColor: kPrimary100,
                        hint: '14 June 2025',
                        hintColor: kQuaternaryColor,
                        isreadonly: true,
                        bordercolor: kPrimary100,
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesCalender,
                          height: 24,
                        ),
                        marginBottom: 0,
                        ontap: () {
                          // pickdate(context, 'Select Date');
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: roundedr(kPrimary100, 200),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: '\$', style: whitetxtStyle),
                              TextSpan(text: ' 31 ', style: secondarytxtstyle),
                              TextSpan(text: 'Per hour', style: whitetxtStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconTextRow(
                  flipX: true,
                  text: 'Add Location',
                  textsize: 16,
                  weight: wmedium,
                  iconcolor: kGrey5Color,
                  iconpath: Assets.imagesArrow,
                  padvertical: 10,
                  textcolor: kQuaternaryColor,
                ),
                Stack(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesMap,
                      width: Get.width,
                      height: 211,
                      radius: 20,
                    ),
                    Positioned.fill(
                      child: Center(
                        child: SuperTooltip(
                          barrierColor: ktransparent,
                          shadowColor: kGreyColorLight,
                          //  bottom: 20,
                          borderColor: ktransparent,
                          hideTooltipOnBarrierTap: true,
                          backgroundColor: kSecondaryColor,
                          popupDirection: TooltipDirection.up,
                          content: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyText(
                                text: "Set Location",

                                color: kQuaternaryColor,
                                weight: FontWeight.w500,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: kQuaternaryColor,
                              ),
                            ],
                          ),
                          child: CommonImageView(
                            imagePath: Assets.imagesMaker,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 10,
                  paddingBottom: 20,
                  text:
                      'Lafayette St &, E Houston St, New York, 10012, United States',
                ),
                MyText(
                  text: 'Set Time Slot',
                  size: 16,
                  weight: wmedium,
                  paddingBottom: 16,
                ),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: roundedr(kSecondaryColor, 200),
                      child: MyText(text: '10:00 AM'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
