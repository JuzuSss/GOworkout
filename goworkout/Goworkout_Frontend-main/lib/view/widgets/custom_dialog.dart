import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.ontap,
    this.title,
    this.subtitle,
    this.btncolor,
    this.btncolor2,
    this.btntext,
    this.fontcolor1,
    this.fontcolor2,
    this.isrow = true,
    this.iscol = F,
    this.path,
    this.btntext2,
    this.ontap2,
    this.height,
    this.outline1color,
    this.outline2color,
    this.mbtnhoriz,
    this.color1,
    this.color2,
    this.weight1,
    this.weight2,
    this.size1,
    this.size2,
  });
  final String? title, subtitle, btntext, btntext2, path;
  final Color? btncolor,
      btncolor2,
      fontcolor1,
      fontcolor2,
      color1,
      color2,
      outline1color,
      outline2color;
  final bool? isrow, iscol;
  final FontWeight? weight1, weight2;
  final VoidCallback? ontap, ontap2;
  final double? height, mbtnhoriz, size1, size2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 0.0, sigmaX: 0),
                child: Container(
                  color: Colors.black.withOpacity(
                    0.02,
                  ), // Add opacity to background
                ),
              ),
            ),
            // Your content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 30,
                        ),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kPrimary100,
                          border: Border.all(color: ktransparent),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //const SizedBox(height: 10),
                            MovingIcon(
                              path: path ?? Assets.imagesLogo,
                              //width: Get.width,
                              height: height ?? 90,
                              // fit: BoxFit.contain,
                            ),
                            MyText(
                              text: title ?? 'Log Out Now?',

                              textAlign: TextAlign.center,
                              color: color1 ?? kQuaternaryColor,
                              fontFamily: SFPRO,
                              size: size1 ?? 23,
                              weight: weight1 ?? FontWeight.w700,
                            ),
                            MyText(
                              text:
                                  subtitle ??
                                  'Log In back and your data will be safe with us.',
                              textAlign: TextAlign.center,
                              paddingBottom: 30,
                              weight: weight2 ?? wregular,
                              paddingRight: 20,
                              paddingLeft: 20,

                              size: size2 ?? 16,
                              color: color2 ?? kQuaternaryColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyButton(
                                    //   gradient: transparentgrad(),
                                    onTap:
                                        ontap ??
                                        () {
                                          //   Get.to(() => Login());
                                        },
                                    buttonText: btntext ?? 'Continue',
                                    mhoriz: mbtnhoriz ?? 0,
                                    backgroundColor:
                                        btncolor ?? kSecondaryColor,
                                    outlineColor: outline1color ?? ktransparent,
                                    fontColor: fontcolor1 ?? kQuaternaryColor,

                                    //  fontColor: kPrimaryColor,
                                  ),
                                ),
                                if (isrow == true) SizedBox(width: 20),
                                if (isrow == true)
                                  Expanded(
                                    child: MyButton(
                                      onTap:
                                          ontap2 ??
                                          () {
                                            //   Get.to(() => Login());
                                          },
                                      buttonText: btntext2 ?? 'Log Out?',

                                      backgroundColor: btncolor2 ?? kRedColor,
                                      fontColor: fontcolor2 ?? kQuaternaryColor,
                                      outlineColor:
                                          outline2color ?? ktransparent,
                                      //  fontColor: kPrimaryColor,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 0),
                            if (iscol == true)
                              MyButton(
                                onTap:
                                    ontap ??
                                    () {
                                      //   Get.to(() => Login());
                                    },
                                buttonText: 'Not now',
                                fontWeight: wregular,
                                backgroundColor: btncolor2 ?? kSecondaryColor,
                                fontColor: fontcolor2 ?? kPrimaryColor,
                                outlineColor: outline2color ?? ktransparent,
                                //  fontColor: kPrimaryColor,
                              ),
                          ],
                        ),
                      ),
                    ],
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
