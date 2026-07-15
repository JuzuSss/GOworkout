import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/screens/booking/reschedule.dart';
import 'package:go_workout/view/screens/home/success.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_dialog.dart';
import 'package:go_workout/view/widgets/expanded_row_buttons.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class ConfirmedDetails extends StatelessWidget {
  final bool? isprev;
  const ConfirmedDetails({
    super.key,
    this.isprev = false,
    this.iscoach,
    this.status,
  });
  final bool? iscoach;
  final String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Details', centerTitle: T),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(16),
            decoration: rounded2(kPrimary100, kPrimary100),
            child: Column(
              children: [
                CommonImageView(
                  url: images[7],
                  radius: 200,
                  height: 60,
                  width: 60,
                ),
                TwoTextedColumn(
                  padVertical: 16,
                  alignment: ColumnAlignment.center,
                  textAlign: TextAlign.center,
                  color2: kGrey5Color,
                  text1: 'Barbara Haque',
                  text2: 'Basketball 1990',
                  size1: 17,
                ),
                MyText(text: 'Date & Time', color: kGrey5Color, paddingTop: 20),
                TwoTextedColumn(
                  padVertical: 0,
                  alignment: ColumnAlignment.center,
                  textAlign: TextAlign.center,
                  color2: kQuaternaryColor,
                  text1: 'Monday, October 24',

                  text2: iscoach == true ? '10:00 AM' : '',
                  size1: 17,
                ),
                MyText(text: 'Address', color: kGrey5Color, paddingTop: 20),
                TwoTextedColumn(
                  padVertical: 0,
                  alignment: ColumnAlignment.center,
                  textAlign: TextAlign.center,
                  color2: kQuaternaryColor,
                  text1: 'San Francisco, California',

                  text2: iscoach == true ? '0.31 mi away' : '',
                  size1: 17,
                ),
                if (iscoach == true)
                  Column(
                    children: [
                      MyText(
                        text: 'Amount',
                        color: kGrey5Color,
                        paddingTop: 20,
                      ),
                      TwoTextedColumn(
                        text1: '\$31',
                        text2: 'Per hour',
                        alignment: ColumnAlignment.center,
                        textAlign: TextAlign.center,
                        color2: kQuaternaryColor,
                        size1: 17,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Spacer(),
          if (isprev != true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: AppSizes.DEFAULT,
                  child: ExpandedRowButtons(
                    btn1BackgroundColor: kPrimary100,
                    btn2BackgroundColor: kPrimary100,
                    btn1OutlineColor: kQuaternaryColor,
                    btn2OutlineColor: kQuaternaryColor,
                    btn1FontColor: kQuaternaryColor,
                    btn2FontColor: kQuaternaryColor,
                    btn2OnTap: () {
                      Get.to(() => Reschedule(iscoach: iscoach));
                    },
                    btn1OnTap: () {
                      Get.dialog(
                        //    barrierColor: kGrey5Color.withOpacity(0.2),
                        CustomDialog(
                          height: 0,
                          title: 'Are you sure?',
                          btncolor: ktransparent,
                          outline1color: kQuaternaryColor,
                          btntext: 'No',
                          btntext2: 'Yes',

                          subtitle: 'You want to cancel this booking?',
                        ),
                      );
                    },
                    btn1Text:
                        status == 'reschedule' ? 'Reject' : 'Cancel Booking',
                    btn2Text: 'Reschedule',
                  ),
                ),
                MyButton(
                  onTap: () {
                    if (iscoach == true && status == 'reschedule') {
                      Get.to(
                        () => Success(ispending: false, title: 'Accepted'),
                      );
                    }
                  },
                  buttonText:
                      iscoach == true && status == 'reschedule'
                          ? 'Accept & Book'
                          : iscoach == true
                          ? 'Chat with Coach'
                          : 'Chat with Coach',
                  mhoriz: 20,
                  mBottom: 30,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
