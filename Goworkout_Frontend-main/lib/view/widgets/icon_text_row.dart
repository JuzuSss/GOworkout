import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    this.iconpath,
    this.text,
    this.textcolor,
    this.iconcolor,
    this.padends,
    this.textsize,
    this.iconsize,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.expanded = true,
    this.flipX,
    this.decoration,
    this.padvertical,
    this.weight = FontWeight.w400,
    this.mBottom,
    this.spacing,
  });
  final String? iconpath, text;
  final Color? textcolor, iconcolor;
  final bool? expanded, flipX;
  final double? padends, textsize, iconsize, padvertical, mBottom, spacing;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? weight;
  final BoxDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: mBottom ?? 0),
      decoration: decoration ?? BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padends ?? 0,
          vertical: padvertical ?? 0,
        ),
        child: AnimatedRow(
          spacing: spacing ?? 0,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          children:
              flipX == true
                  ? [
                    if (mainAxisAlignment == MainAxisAlignment.end)
                      Expanded(child: SizedBox()),
                    if (expanded == true)
                      Expanded(
                        child: MyText(
                          paddingLeft: 5,
                          weight: weight,
                          color: textcolor ?? kGrey5Color,
                          text: text ?? '15 min • 1.5km ',
                          size: textsize ?? 11,
                        ),
                      ),
                    if (expanded == false)
                      MyText(
                        paddingLeft: 5,
                        weight: weight,
                        color: textcolor ?? kGrey5Color,
                        text: text ?? '15 min • 1.5km ',
                        size: textsize ?? 11,
                      ),
                    Image.asset(
                      color: iconcolor ?? null,
                      iconpath ?? Assets.imagesLogo,
                      height: iconsize ?? 17,
                    ),
                  ]
                  : [
                    if (mainAxisAlignment == MainAxisAlignment.end)
                      Expanded(child: SizedBox()),
                    Image.asset(
                      color: iconcolor ?? null,
                      iconpath ?? Assets.imagesLogo,
                      height: iconsize ?? 17,
                    ),
                    if (expanded == true)
                      Expanded(
                        child: MyText(
                          paddingLeft: 5,
                          weight: weight,
                          color: textcolor ?? kGrey5Color,
                          text: text ?? '15 min • 1.5km ',
                          size: textsize ?? 11,
                        ),
                      ),
                    if (expanded == false)
                      MyText(
                        paddingLeft: 5,
                        weight: weight,
                        color: textcolor ?? kGrey5Color,
                        text: text ?? '15 min • 1.5km ',
                        size: textsize ?? 11,
                      ),
                  ],
        ),
      ),
    );
  }
}
