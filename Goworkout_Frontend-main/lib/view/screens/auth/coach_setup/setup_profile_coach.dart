import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/coach_setup/add_session.dart';
import 'package:go_workout/view/screens/auth/profile_setup.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_bottom_sheet.dart';
import 'package:go_workout/view/widgets/custom_dialog.dart';
import 'package:go_workout/view/widgets/custom_drop_down.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/nationality_picker.dart';

class SetupProfileCoach extends StatelessWidget {
  const SetupProfileCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBallStack(),
          Scaffold(
            backgroundColor: ktransparent,

            body: Column(
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
                      AuthHeader(
                        space: 0,
                        title: 'Set Your Profile',
                        subtitle1:
                            'Set up your profile and showcase your skill level ',
                        subtitle2: ' skill level',
                        color1: kGrey5Color,
                        color2: kSecondaryColor,
                      ),
                      MyText(
                        text: 'and photo to start connecting',
                        color: kGrey5Color,
                        paddingBottom: 34,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 159,
                            width: Get.width,
                            color: kPrimary100,
                            child: Column(
                              children: [
                                IconTextRow(
                                  flipX: true,
                                  iconpath: Assets.imagesCam,
                                  iconcolor: kGrey5Color,
                                  padends: 20,
                                  padvertical: 16,
                                  textsize: 14,
                                  iconsize: 24,
                                  text: 'Upload Banner',
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -90,
                            right: 0,
                            left: 0,
                            child: Column(
                              children: [
                                PhotoStack(),
                                MyText(
                                  text: 'Upload Your Photo',
                                  size: 16,
                                  weight: wmedium,
                                  paddingTop: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 110),
                      MyTextField(
                        suffixIcon: Image.asset(
                          color: kGrey5Color,
                          Assets.imagesArrow,
                          height: 18,
                          width: 30,
                        ),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: CustomDropDown(
                              heading: '',
                              hint: 'Experience',
                              items: [],
                              hintSize: 14,
                              marginBottom: 0,
                              haveHeading: false,
                            ),
                          ),
                          Expanded(
                            child: MyTextField(
                              hint: '\$ 00 Per hour',
                              marginBottom: 0,
                            ),
                          ),
                        ],
                      ),
                      MyButton(
                        onTap: () {
                          Get.bottomSheet(
                            ConnectWalletBottom(),
                            isScrollControlled: true,
                          );
                        },
                        buttonText: 'Connect Wallet',
                        mTop: 20,
                        backgroundColor: ktransparent,
                        outlineColor: kQuaternaryColor,
                      ),
                    ],
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

class ConnectWalletBottom extends StatelessWidget {
  const ConnectWalletBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      bgcolor: kPrimaryColor,
      padends: 0,
      children: [
        Padding(
          padding: AppSizes.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonImageView(imagePath: Assets.imagesClose, height: 24),
              MyText(text: 'Connect Wallet', weight: wmedium, size: 18),
              SizedBox(width: 24),
            ],
          ),
        ),
        Divider(color: kPrimary100, height: 0),
        MyText(
          text: 'Choose Country',
          size: 16,
          paddingLeft: 20,
          paddingBottom: 20,
          paddingTop: 16,
        ),
        Padding(
          padding: AppSizes.HORIZONTAL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryPickerButton(selectedFlag: '🇺🇸'.obs),
              SizedBox(height: 20),
              MyText(text: 'Bank Details', size: 16, paddingBottom: 20),
              CustomDropDown(
                heading: '',
                hint: 'Select Bank',
                items: [],
                haveHeading: false,
                hintSize: 16,
                headingColor: kGrey2Color,
              ),
              MyTextField(hint: 'IBAN Number'),
              MyTextField(hint: 'Account Number'),
              MyButton(
                onTap: () {
                  Get.back();

                  Get.dialog(
                    CustomDialog(
                      path: Assets.imagesCard,
                      weight1: wregular,
                      isrow: false,
                      title: 'Wallet Connected!',
                      mbtnhoriz: 50,
                      btncolor: kQuaternaryColor,
                      fontcolor1: kTertiaryColor,
                      btntext: 'Okay',
                      ontap2: () {
                        Get.to(() => AddSession());
                      },
                      ontap: () {
                        Get.to(() => AddSession());
                      },
                      subtitle:
                          'Congrats, your bank account is connected successfully',
                    ),
                  );
                },
                buttonText: 'Connect Wallet',
                outlineColor: kQuaternaryColor,
                backgroundColor: kQuaternaryColor,
                fontColor: kTertiaryColor,
                mBottom: 20,
              ),
              AuthRichText(
                normalText:
                    'By providing your credit cards details, you agree to Whetan ',
                tappableText: 'Terms and Conditions ',
                onTap: () {},
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
