import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';

import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class IconTitleSubtitle extends StatelessWidget {
  const IconTitleSubtitle({
    super.key,
    this.title,
    this.path,
    this.iconRadis,
    this.subtitle,
    this.iconheight,
    this.size1,
    this.gap,
    this.trailing,
    this.size2,
    this.isurl = false,
    this.color1,
    this.hastsubtitle = false,
    this.color2,
    this.subtitle2,
    this.padEnds,
    this.padVertical,
    this.hasicon = true,
    this.hasthirdtext = false,
    this.decoration,
    this.colspace,
    this.crossAxisAlignment,
    this.hastrailing = true,
    this.ontralingTap,
    this.ontap,
    this.rowspace,
    this.iconcolor,
    this.weight1,
    this.weight2,
    this.isradiotile,
    this.radiovalue,
    this.size3,
    this.hastrailingradio,
  });
  final String? title, path, subtitle, subtitle2;
  final double? iconheight,
      size1,
      size2,
      size3,
      gap,
      padEnds,
      iconRadis,
      padVertical,
      colspace,
      rowspace;
  final Widget? trailing;
  final bool? isurl,
      hasthirdtext,
      hasicon,
      hastsubtitle,
      hastrailing,
      hastrailingradio,
      isradiotile;
  final Color? color1, color2, iconcolor;
  final Decoration? decoration;
  final bool? radiovalue;
  final CrossAxisAlignment? crossAxisAlignment;
  final VoidCallback? ontralingTap, ontap;
  final FontWeight? weight1, weight2;
  @override
  Widget build(BuildContext context) {
    return ontap != null
        ? Bounce(
          onTap: ontap,
          child: Container(
            decoration: decoration ?? BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padEnds ?? 0,
                vertical: padVertical ?? 0,
              ),
              child: AnimatedRow(
                spacing: rowspace ?? 8,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                children: [
                  if (isradiotile == true)
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color:
                              radiovalue == true
                                  ? kSecondaryColor
                                  : kGreyColorLight,
                        ),
                      ),
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(2),
                        height: 20,
                        width: 20,
                        duration: Duration(milliseconds: 300),
                        decoration: circle(
                          radiovalue == true ? kSecondaryColor : ktransparent,
                          radiovalue == true ? kSecondaryColor : ktransparent,
                        ),
                      ),
                    ),
                  if (hasicon == true)
                    isurl == true
                        ? CommonImageView(
                          height: iconheight ?? 32,
                          width: iconheight ?? 32,
                          radius: iconRadis ?? 200,
                          url: path ?? dummyImage,
                        )
                        : Image.asset(
                          height: iconheight ?? 32,
                          path ?? Assets.imagesLogo,
                          color: iconcolor ?? null,
                        ),
                  Expanded(
                    child: Column(
                      spacing: colspace ?? 0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: title ?? 'Credit or debit card',
                          size: size1 ?? 14,
                          weight: weight1 ?? FontWeight.w600,
                          paddingBottom: gap ?? 0,
                          color: color1 ?? kSecondaryColor,
                        ),
                        if (hastsubtitle == true)
                          MyText(
                            color: color2 ?? null,
                            size: size2 ?? 12,
                            text: subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                            weight: weight2 ?? FontWeight.w400,
                          ),
                        if (hasthirdtext == true)
                          MyText(
                            color: color2 ?? null,
                            size: size3 ?? 14,
                            text: subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                          ),
                      ],
                    ),
                  ),
                  if (hastrailing == true) trailing ?? SizedBox(),
                  if (hastrailingradio == true)
                    AnimatedContainer(
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color:
                              radiovalue == true
                                  ? kSecondaryColor
                                  : kGreyColorLight,
                        ),
                      ),
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(2),
                        height: 20,
                        width: 20,
                        duration: Duration(milliseconds: 300),
                        decoration: circle(
                          radiovalue == true ? kSecondaryColor : ktransparent,
                          radiovalue == true ? kSecondaryColor : ktransparent,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
        : Container(
          decoration: decoration ?? BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padEnds ?? 0,
              vertical: padVertical ?? 0,
            ),
            child: AnimatedRow(
              spacing: rowspace ?? 8,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                if (isradiotile == true)
                  AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color:
                            radiovalue == true
                                ? kSecondaryColor
                                : kGreyColorLight,
                      ),
                    ),
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(2),
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 300),
                      decoration: circle(
                        radiovalue == true ? kSecondaryColor : ktransparent,
                        radiovalue == true ? kSecondaryColor : ktransparent,
                      ),
                    ),
                  ),
                if (hasicon == true)
                  isurl == true
                      ? CommonImageView(
                        height: iconheight ?? 32,
                        width: iconheight ?? 32,
                        radius: iconRadis ?? 200,
                        url: path ?? dummyImage,
                      )
                      : Image.asset(
                        height: iconheight ?? 32,
                        path ?? Assets.imagesLogo,
                        color: iconcolor ?? null,
                      ),

                Expanded(
                  child: Column(
                    spacing: colspace ?? 0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: title ?? 'Credit or debit card',
                        size: size1 ?? 14,
                        weight: weight1 ?? FontWeight.w600,
                        paddingBottom: gap ?? 0,
                        color: color1 ?? null,
                      ),
                      if (hastsubtitle == true)
                        MyText(
                          color: color2 ?? null,
                          size: size2 ?? 12,
                          text: subtitle ?? 'Visa, Mastercard, AMEX and JCB',
                          weight: weight2 ?? FontWeight.w400,
                        ),
                      if (hasthirdtext == true)
                        MyText(
                          color: color2 ?? null,
                          size: size3 ?? 14,
                          weight: wmedium,
                          text: subtitle2 ?? 'Visa, Mastercard, AMEX and JCB',
                        ),
                    ],
                  ),
                ),
                if (hastrailing == true) trailing ?? SizedBox(),
                if (hastrailingradio == true)
                  AnimatedContainer(
                    height: 20,
                    width: 20,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color:
                            radiovalue == true
                                ? kSecondaryColor
                                : kGreyColorLight,
                      ),
                    ),
                    child: AnimatedContainer(
                      margin: EdgeInsets.all(2),
                      height: 20,
                      width: 20,
                      duration: Duration(milliseconds: 300),
                      decoration: circle(
                        radiovalue == true ? kSecondaryColor : ktransparent,
                        radiovalue == true ? kSecondaryColor : ktransparent,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
  }
}
