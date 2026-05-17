import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_row.dart';
import 'package:go_workout/view/widgets/expanded_row_buttons.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class TransDetails extends StatelessWidget {
  const TransDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transferDetails = [
      {'title': 'Transfer ID', 'subtitle': '#129091DY1730'},
      {'title': 'Transfer Amount', 'subtitle': '\$25.00'},
      {'title': 'Platform Fee', 'subtitle': '\$00.00'},
      {'title': 'Date', 'subtitle': '25 June 2025, Monday'},
      {'title': 'Time', 'subtitle': '10:00 PM'},
    ];

    return Scaffold(
      appBar: simpleAppBar(title: 'Details', centerTitle: T),
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
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  decoration: roundedr(kPrimary100, 20),
                  child: AnimatedColumn(
                    spacing: 10,
                    children: [
                      CommonImageView(
                        url: images[7],
                        height: 85,
                        width: 85,
                        radius: 300,
                      ),
                      TwoTextedColumn(
                        padVertical: 20,
                        alignment: ColumnAlignment.center,
                        text1: '\$25.00',
                        text2: 'Transfer to Barbara Haque',
                        color1: kSecondaryColor,
                        color2: kGrey2Color,
                        size1: 33,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.all(16),
                  color: kPrimary100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: 'Detail Transaction',
                        size: 16,
                        weight: wmedium,
                        paddingBottom: 10,
                      ),
                      for (int i = 0; i < transferDetails.length; i++)
                        CustomRow(
                          left: transferDetails[i]['title'],
                          right: transferDetails[i]['subtitle'],
                          sizeleft: 13,
                          sizeright: 13,
                          padvertical: 10,
                          padends: 10,
                        ),

                      MyText(
                        text: 'Detail Recipient',
                        size: 16,
                        paddingTop: 20,
                        weight: wmedium,
                        paddingBottom: 10,
                      ),
                      for (int i = 0; i < 2; i++)
                        CustomRow(
                          left: i == 0 ? 'Recipient Name' : "Payment Type",
                          right: i == 0 ? 'Jhon Watson' : 'PayPal',
                          sizeleft: 13,
                          sizeright: 13,
                          padvertical: 10,
                          padends: 10,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 30,
              right: 20,
              left: 20,
            ),
            child: ExpandedRowButtons(
              btn1BackgroundColor: ktransparent,
              btn2BackgroundColor: kQuaternaryColor,
              btn1FontColor: kQuaternaryColor,
              btn2FontColor: kTertiaryColor,
              btn1OutlineColor: kQuaternaryColor,
              btn1Text: 'Share',
              btn2Text: 'Download',
            ),
          ),
        ],
      ),
    );
  }
}
