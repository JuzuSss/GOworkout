import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/home/success.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_bottom_sheet.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class PaymentBottom extends StatelessWidget {
  const PaymentBottom({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt index2 = 0.obs;
    List<String> paths = [
      Assets.imagesVisa,
      Assets.imagesMaster,
      Assets.imagesGpay,
      Assets.imagesAMEX,
      Assets.imagesApplepay,
    ];
    return CustomBottomSheet(
      padends: 0,
      bgcolor: kPrimary100,
      children: [
        Padding(
          padding: AppSizes.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonImageView(imagePath: Assets.imagesClose, height: 24),
              MyText(text: 'Payment Method', weight: wmedium, size: 18),
              SizedBox(width: 24),
            ],
          ),
        ),
        Divider(height: 0, color: kGrey5Color),
        MyText(
          text: 'Choose Type',
          size: 16,
          paddingTop: 20,
          paddingLeft: 20,
          paddingBottom: 20,
        ),
        Padding(
          padding: AppSizes.HORIZONTAL,
          child: Row(
            spacing: 10,
            children: [
              for (int i = 0; i < 5; i++)
                Expanded(
                  child: Obx(
                    () => Bounce(
                      onTap: () {
                        index2.value = i;
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: rounded2r(
                          index2.value == i
                              ? kSecondaryColor.withOpacity(0.1)
                              : i == 3
                              ? kSecondaryBlue
                              : kQuaternaryColor,
                          index2.value == i
                              ? kSecondaryColor
                              : kQuaternaryColor,
                          6,
                        ),
                        child: Image.asset(
                          paths[i],
                          height: 18,
                          color:
                              index2.value == i
                                  ? null
                                  : i == 0
                                  ? kSecondaryColor
                                  : null,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'Card Details',
                size: 16,
                weight: wmedium,
                paddingBottom: 20,
              ),
              MyTextField(hint: 'Name on card'),
              MyTextField(hint: 'Card number'),
              Row(
                spacing: 10,
                children: [
                  Expanded(child: MyTextField(hint: 'MM/YY')),
                  Expanded(child: MyTextField(hint: 'CVC')),
                ],
              ),
              MyButton(
                onTap: () {
                  Get.to(() => Success());
                },
                buttonText: 'Save Card',
                backgroundColor: kQuaternaryColor,
                fontColor: kTertiaryColor,
                mBottom: 20,
              ),
              Center(
                child: AuthRichText(
                  normalText:
                      'By providing your credit cards details, you agree to Whetan ',
                  tappableText: 'Terms and Conditions ',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
