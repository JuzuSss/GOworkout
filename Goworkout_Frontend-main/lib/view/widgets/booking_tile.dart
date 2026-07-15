import 'dart:math';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/booking/confirmed_details.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class BookingTile extends StatelessWidget {
  final String? status, path;

  const BookingTile({super.key, this.status, this.path, this.iscoach});
  final bool? iscoach;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9.0),
      child: IconTitleSubtitle(
        ontap: () {
          if (status == 'prev') {
            Get.to(() => ConfirmedDetails(isprev: true, iscoach: iscoach));
          } else if (status != 'cancelled') {
            Get.to(() => ConfirmedDetails(iscoach: iscoach));
          } else {
            Get.to(() => ConfirmedDetails(isprev: false, iscoach: iscoach));
          }
        },
        isurl: true,
        color1: kQuaternaryColor,
        hasthirdtext: true,
        hastsubtitle: true,
        path: path ?? dummyImage,
        iconheight: 63,
        iconRadis: 200,
        title: 'Barbara Haque',
        size1: 16,
        subtitle: 'Monday, June 25',
        size2: 13,
        decoration: roundedr(kPrimary100, 10),
        padEnds: 10,
        padVertical: 10,
        subtitle2: '10:00',
        color2: kGrey5Color,
        trailing: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            status == 'prev'
                ? MyText(
                  text: 'Add a review',
                  color: kSecondaryColor,
                  decoration: TextDecoration.underline,
                )
                : Bounce(
                  scale: status == 'cancelled' ? false : true,
                  onTap: () {},
                  child: Opacity(
                    opacity: status == 'cancelled' ? 0.2 : 1,
                    child: CommonImageView(
                      svgPath: Assets.imagesSend2,
                      height: 40,
                    ),
                  ),
                ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
              decoration: rounded2r(
                status == 'cancelled'
                    ? kGrey5Color
                    : status == 'prev'
                    ? kQuaternaryColor
                    : kSecondaryColor,
                status == 'cancelled'
                    ? kGrey5Color
                    : status == 'prev'
                    ? kQuaternaryColor
                    : kSecondaryColor,
                100,
              ),
              child: Center(
                child: MyText(
                  text:
                      status == 'cancelled'
                          ? 'Canceled'
                          : status == 'prev'
                          ? 'Completed'
                          : 'Confirmed',
                  weight: wsemibold,
                  color:
                      status == 'cancelled' || status == 'prev'
                          ? kTertiaryColor
                          : kQuaternaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
