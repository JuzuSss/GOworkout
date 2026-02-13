import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

AppBar simpleAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  bool? centerTitle,
  hasTitleimage = false,
  List<Widget>? actions,
  double? height,
  double? bottomheight,
  double? leadingwidth,
  Widget? bottom,
}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size(0, bottomheight ?? 0),
      child: bottom ?? SizedBox(),
    ),
    toolbarHeight: 76,
    surfaceTintColor: kPrimaryColor,
    foregroundColor: kPrimaryColor,
    backgroundColor: bgColor ?? kPrimaryColor,
    centerTitle: centerTitle ?? F,
    shadowColor: ktransparent,
    leadingWidth: haveBackButton == false ? 0 : 46,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  SizedBox(width: 10),
        if (haveBackButton!)
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onBackIconTap ?? () => Get.back(),
                  child: Image.asset(
                    Assets.imagesBack,
                    height: height ?? 24,
                    color: contentColor ?? null,
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
    title:
        centerTitle == T
            ? MyText(
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              text: title ?? '',
              size: 24,
              //    textAlign: centerTitle == true ? TextAlign.center : null,
              weight: FontWeight.w700,
              color: contentColor ?? kQuaternaryColor,
            )
            : Row(
              spacing: 10,
              children: [
                if (hasTitleimage == true)
                  CommonImageView(
                    url: dummyImage,
                    height: 40,
                    width: 40,
                    radius: 100,
                  ),
                Expanded(
                  child: MyText(
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    text: title ?? '',
                    size: 24,
                    //    textAlign: centerTitle == true ? TextAlign.center : null,
                    weight: FontWeight.w700,
                    color: contentColor ?? kQuaternaryColor,
                  ),
                ),
              ],
            ),
    actions: actions,
  );
}

ClipRRect simpleAppBar2({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  bool? haveBackButton = true,
  List<Widget>? actions,
  double? height,
  PreferredSize? bottom,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    child: AppBar(
      bottom: bottom,
      toolbarHeight: 76,
      surfaceTintColor: kPrimaryColor,
      foregroundColor: kPrimaryColor,
      backgroundColor: bgColor ?? kPrimaryColor,
      shadowColor: kPrimaryColor,
      centerTitle: T,
      leadingWidth: haveBackButton == false ? 0 : null,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10),
          if (haveBackButton!)
            GestureDetector(
              onTap: onBackIconTap ?? () => Get.back(),
              child: Image.asset(Assets.imagesBack, height: height ?? 40),
            ),
        ],
      ),
      title: MyText(
        text: title ?? '',
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
        size: 18,
        weight: FontWeight.w600,
        color: contentColor ?? kTertiaryColor,
      ),
      actions: actions,
    ),
  );
}

AppBar homeAppBar({
  String? title,
  VoidCallback? onBackIconTap,
  Color? bgColor,
  Color? contentColor,
  PreferredSizeWidget? bottom,
  Widget? choiceIcon,
  bool? issearch = false,
  bool? haveBackButton = true,
  List<Widget>? actions,
}) {
  return AppBar(
    toolbarHeight: 85,
    foregroundColor: kPrimaryColor,
    surfaceTintColor: kPrimaryColor,
    backgroundColor: bgColor ?? kPrimaryColor,
    centerTitle: false,
    leadingWidth: issearch == true ? Get.width : 0,
    leading:
        issearch == true
            ? Row(
              children: [
                SizedBox(width: 16),
                GestureDetector(
                  onTap: onBackIconTap ?? () => Get.back(),
                  child: Image.asset(Assets.imagesLogo, height: 24),
                ),
                // searchwidget ?? Container(),
              ],
            )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [if (haveBackButton == true) Row(children: [])],
            ),
    title: MyText(
      paddingLeft: 16,
      paddingTop: 30,
      text: title ?? 'Login',
      size: 32,
      maxLines: 1,
      textOverflow: TextOverflow.ellipsis,
      weight: FontWeight.w500,
      paddingBottom: 24,
    ),
    actions:
        actions ??
        [
          InkWell(
            onTap: () {
              //   Get.to(() => NotificationsPage());
            },
            child: CommonImageView(
              /// imagePath: Assets.imagesNotifications,
              height: 40,
              width: 40,
            ),
          ),
          choiceIcon ?? SizedBox.shrink(),
          SizedBox(width: 20),
        ],
    bottom: bottom,
  );
}
