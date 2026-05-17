import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class Menutile extends StatelessWidget {
  const Menutile({
    super.key,
    this.path,
    this.title,
    this.hasicon = true,
    this.ontap,
    this.trailIcon,
    this.hasline = true,
    this.trailing,
    this.textcolor,
    this.trailtext,
    this.iconcolor,
    this.linecolor,
    this.space,
    this.leadingcolor,
  });
  final String? path, title, trailIcon, trailtext;
  final VoidCallback? ontap;
  final bool? hasline, hasicon;
  final Widget? trailing;
  final Color? textcolor, leadingcolor, iconcolor, linecolor;
  final double? space;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTitleSubtitle(
          hasicon: hasicon ?? true,
          path: path,
          size1: 14,

          iconheight: 20,
          iconcolor: leadingcolor ?? null,
          color1: textcolor ?? kTertiaryColor,
          title: title,
          weight1: wsemibold,
          ontap: ontap,
          padEnds: 20,
          hastsubtitle: false,
          trailing:
              trailing ??
              Row(
                spacing: 6,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    text: trailtext ?? '',
                    color: kGreyColor,
                    size: 14,
                    weight: wsemibold,
                  ),
                  Image.asset(
                    color: iconcolor ?? null,
                    trailIcon ?? Assets.imagesRight2,
                    height: 19,
                  ),
                ],
              ),
          padVertical: space ?? 12,
        ),
        if (hasline == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: linecolor ?? kPrimary100, height: 0),
          ),
      ],
    );
  }
}
