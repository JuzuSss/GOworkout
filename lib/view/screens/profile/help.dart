import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> coachBookingDetails = [
      {
        'title': 'How do I book a session with a coach?',
        'subtitle': 'Availability / Fare / Policy',
      },
      {
        'title': 'How do coaches get paid?',
        'subtitle': 'Need some Technical Help Issues',
      },
      {
        'title': 'Can I cancel or reschedule a session?',
        'subtitle': 'Need Help with Coach Referral Program',
      },
      {
        'title': 'What payment methods are supported?',
        'subtitle': 'Need Help with Offer?',
      },
      {
        'title': 'Is there a way to communicate...',
        'subtitle': 'Need any Help with Coach Wallets?',
      },
    ];
    return Scaffold(
      appBar: simpleAppBar(title: 'Help', centerTitle: T),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kPrimary100,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                  ),
                  child: AnimatedRow(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              weight: wmedium,
                              text:
                                  'Have a Query Related to your Bookings or Your Previous Concerns?',
                              size: 15,
                              color: kGrey2Color,
                            ),
                            Divider(color: kGrey5Color),
                          ],
                        ),
                      ),
                      CommonImageView(
                        imagePath: Assets.imagesHelp2,
                        height: 80,
                      ),
                    ],
                  ),
                ),
                MyText(
                  text: 'Other Topics:',
                  size: 16,
                  weight: wsemibold,
                  paddingTop: 20,
                  paddingBottom: 20,
                ),
                for (int i = 0; i < coachBookingDetails.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: IconTitleSubtitle(
                      decoration: roundedr(kPrimary100, 20),
                      color2: kGrey5Color,
                      title: coachBookingDetails[i]['title'],
                      subtitle: coachBookingDetails[i]['subtitle'],
                      hastsubtitle: true,
                      hasicon: false,
                      trailing: CommonImageView(
                        imagePath: Assets.imagesRight2,
                        height: 24,
                      ),
                      padEnds: 16,
                      padVertical: 20,
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
