import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/home/payment_bottom.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = [
      {
        'title': 'Date & Time',
        'subtitle': 'Monday, October 24',
        'third': '10:00 AM',
      },
      {
        'title': 'Coach',
        'subtitle': 'Barbara Michelle',
        'third': 'Basketball 1990',
      },
      {
        'title': 'Address',
        'subtitle': 'San Francisco, California',
        'third': '0.31 mi away',
      },
      {
        'title': 'Payment Method',
        'subtitle': 'Choose payment method',
        'third': '',
      },
      {'title': 'Fee', 'subtitle': 'Total', 'third': '\$75/ hour'},
    ];
    return Scaffold(
      appBar: simpleAppBar(),
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
                  text: 'Overview',
                  size: 24,
                  weight: wsemibold,
                  paddingBottom: 20,
                ),
                ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, index) => IconTitleSubtitle(
                        hasicon: false,
                        padVertical: 10,
                        hasthirdtext: true,
                        hastsubtitle: true,
                        title: data[index]['title'],
                        size1: 13,
                        color1: kGrey5Color,
                        weight1: wregular,
                        subtitle: data[index]['subtitle'],
                        size2: 16,
                        size3: 13,
                        subtitle2: data[index]['third'],
                        trailing:
                            index == 4
                                ? MyText(text: '\$75')
                                : CommonImageView(
                                  imagePath: Assets.imagesRight2,
                                  height: 24,
                                ),
                      ),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: kQuaternaryColor);
                  },
                ),
              ],
            ),
          ),
          MyButton(
            onTap: () {
              Get.bottomSheet(PaymentBottom(), isScrollControlled: true);
            },
            buttonText: 'Confirm',
            mhoriz: 20,
            mBottom: 30,
          ),
        ],
      ),
    );
  }
}
