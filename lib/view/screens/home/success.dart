import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/booking/reschedule.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Success extends StatefulWidget {
  const Success({super.key, this.title, this.ispending = true});
  final String? title;
  final bool? ispending;
  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    //  bool ispending = true;
    bool isshow = false;
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
                Center(
                  child: CommonImageView(
                    imagePath: Assets.imagesTick,
                    height: 40,
                  ),
                ),
                TwoTextedColumn(
                  padVertical: 16,
                  alignment: ColumnAlignment.center,
                  textAlign: TextAlign.center,
                  color2: kGrey5Color,
                  text1: widget.title ?? 'Success!',
                  text2:
                      'Thank you for choosing our service and trust our coaches. Enjoy your session!',
                  size1: 33,
                ),
                Container(
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
                      MyText(
                        text: 'Date & Time',
                        color: kGrey5Color,
                        paddingTop: 20,
                      ),
                      TwoTextedColumn(
                        padVertical: 0,
                        alignment: ColumnAlignment.center,
                        textAlign: TextAlign.center,
                        color2: kQuaternaryColor,
                        text1: 'Monday, October 24',

                        text2: '10:00 AM',
                        size1: 17,
                      ),
                      MyText(
                        text: 'Address',
                        color: kGrey5Color,
                        paddingTop: 20,
                      ),
                      TwoTextedColumn(
                        padVertical: 0,
                        alignment: ColumnAlignment.center,
                        textAlign: TextAlign.center,
                        color2: kQuaternaryColor,
                        text1: 'San Francisco, California',

                        text2: '0.31 mi away',
                        size1: 17,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: MyButton(
                        onTap: () {},
                        buttonText: 'Cancel Booking',
                        fontSize: 14,
                        fontWeight: wsemibold,
                        backgroundColor: ktransparent,
                        outlineColor: kQuaternaryColor,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          MyButton(
                            onTap: () {
                              Get.to(() => Reschedule());
                            },
                            buttonText:
                                widget.ispending == false
                                    ? 'Reschedule'
                                    : 'Request Pending',
                            fontSize: 14,
                            backgroundColor: ktransparent,
                            outlineColor:
                                widget.ispending == false
                                    ? kQuaternaryColor
                                    : kSecondaryColor,
                            fontWeight: wsemibold,
                            fontColor:
                                widget.ispending == false
                                    ? kQuaternaryColor
                                    : kSecondaryColor,
                          ),
                          if (widget.ispending == true)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                  isshow = !isshow;
                                  print(isshow);
                                },
                                child: CommonImageView(
                                  imagePath: Assets.imagesInfo,
                                  height: 16,
                                ),
                              ),
                            ),

                          if (widget.ispending == true)
                            Positioned(
                              top: -60,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: rounded2(
                                  kPrimaryColor,
                                  kBorderColor,
                                ),
                                child: Center(
                                  child: MyText(
                                    size: 10,
                                    textAlign: TextAlign.center,
                                    text:
                                        'Your Rescheduling request was sent to\nthe coach and waiting for approval',
                                    color: kGrey2Color,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                MyButton(onTap: () {}, buttonText: 'Chat with Coach', mTop: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
