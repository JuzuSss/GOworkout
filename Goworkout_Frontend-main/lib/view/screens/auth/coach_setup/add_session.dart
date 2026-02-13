import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/coach_setup/my_sessions.dart';
import 'package:go_workout/view/screens/bottom_nav_bar/bottom_nav_coach.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/custom_dialog.dart';
import 'package:go_workout/view/widgets/custom_wrap.dart';
import 'package:go_workout/view/widgets/date_pick.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AddSession extends StatelessWidget {
  const AddSession({super.key, this.isauth = true, this.title});
  final bool? isauth;
  final String? title;
  @override
  Widget build(BuildContext context) {
    List<String> items = ['10.00 AM', '11.00 AM', 'Add +'];
    RxInt currrentIndex = 0.obs;
    return Scaffold(
      appBar: simpleAppBar(
        haveBackButton: isauth == true ? false : true,
        title: 'Add Session',
        centerTitle: true,
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
                  text: title ?? 'Session Details',
                  size: 16,
                  weight: wmedium,
                  paddingBottom: 20,
                ),
                AnimatedRow(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: MyTextField(
                        hint: 'Date',
                        isreadonly: true,
                        suffixIcon: CommonImageView(
                          imagePath: Assets.imagesCalender,
                          height: 24,
                        ),
                        ontap: () {
                          pickdate(context, 'Select Date');
                        },
                      ),
                    ),
                    Expanded(
                      child: MyTextField(
                        prefixIcon: MyText(text: '\$'),
                        hint: '00 Per hour',
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
                GridView.builder(
                  padding: EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust column count
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          currrentIndex.value = index;
                          if (isauth == true || index == 2) {
                            Get.to(() => MySessions());
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: rounded2r(
                            currrentIndex.value == index
                                ? kSecondaryColor
                                : ktransparent,
                            currrentIndex.value == index
                                ? kSecondaryColor
                                : kGreyColor,
                            100,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: MyText(
                              text: items[index],
                              paddingLeft: index == 0 ? 16 : 7,
                              paddingRight: index == 0 ? 16 : 7,
                              size: 14,
                              textAlign: TextAlign.center,
                              weight:
                                  currrentIndex.value == index
                                      ? wsemibold
                                      : wregular,
                              color:
                                  currrentIndex.value == index
                                      ? kQuaternaryColor
                                      : kGreyColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Obx(
                //   () => CustomWrap(
                //     hasicon: false,
                //     outlinecolor: kQuaternaryColor,
                //     currentindex: currrentIndex.value,
                //     ontap: (index) {
                //       currrentIndex.value = index;
                //       if (isauth == true)
                //         if (index == 2) {
                //           Get.to(() => MySessions());
                //         }
                //     },
                //     items: ['10.00 AM', '11.00 AM', '   Add +   '],
                //   ),
                // ),
                SizedBox(height: 30),
                MyButton(
                  onTap: () {
                    Get.dialog(
                      CustomDialog(
                        height: 0,
                        title: 'Session Created!',
                        subtitle: 'Session Created!',
                        isrow: false,
                        btncolor: ktransparent,
                        outline1color: kQuaternaryColor,
                        btntext: 'Okay',
                        mbtnhoriz: 80,
                        ontap: () {
                          Get.to(() => BottomNavCoach());
                        },
                      ),
                    );
                  },
                  buttonText: isauth == false ? 'Update' : 'Add Session',
                ),
                if (isauth == true)
                  MyButton(
                    onTap: () {},
                    mTop: 20,
                    mBottom: 30,
                    mhoriz: 50,
                    buttonText: 'Skip for now',
                    backgroundColor: ktransparent,
                    outlineColor: kQuaternaryColor,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
