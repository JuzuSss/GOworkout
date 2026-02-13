import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/coach_setup/add_session.dart';
import 'package:go_workout/view/screens/auth/coach_setup/session_details.dart';
import 'package:go_workout/view/screens/auth/set_location.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/widget_text_row.dart';

class MySessions extends StatelessWidget {
  const MySessions({super.key, this.isauth = true});
  final bool? isauth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'My Sessions',
        haveBackButton: isauth == true ? F : T,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15),
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SessionsTile(),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Bounce(
                onTap: () {
                  if (isauth == true) {
                    Get.to(() => AddSession());
                  } else {
                    Get.to(() => AddSession(isauth: F));
                  }
                },
                child: Container(
                  decoration: circle(kQuaternaryColor, kQuaternaryColor),
                  height: 78,
                  width: 78,
                  child: Icon(Icons.add, color: kTertiaryColor),
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          if (isauth == true)
            MyButton(
              onTap: () {
                Get.to(() => SetLocation());
              },
              buttonText: 'Next',
              mhoriz: 60,
              mTop: 20,
            ),
        ],
      ),
    );
  }
}

class SessionsTile extends StatelessWidget {
  const SessionsTile({super.key, this.isedit = true, this.ontap});
  final bool? isedit;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap:
          ontap ??
          () {
            Get.to(() => SessionDetails());
          },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: roundedr(kPrimary100, 12),
        child: AnimatedRow(
          children: [
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: '14 June', size: 16, weight: wsemibold),
                  IconTextRow(
                    text: 'Bronx, New York(NY)',
                    iconpath: Assets.imagesMaker,
                    iconcolor: kGrey5Color,
                    textsize: 12,
                  ),
                  WidgetTextRow(
                    textSize: 12,
                    flipX: true,
                    text: '12:00 - 14:00 (1 hour)',
                    child: Icon(Icons.circle, color: kSecondaryColor, size: 14),
                  ),
                ],
              ),
            ),
            Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isedit == true
                    ? CommonImageView(imagePath: Assets.imagesEdit, height: 18)
                    : SizedBox(height: 18),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          ],
        ),
      ),
    );
  }
}
