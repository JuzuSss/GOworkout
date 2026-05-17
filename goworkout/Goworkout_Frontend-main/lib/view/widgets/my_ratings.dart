import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size, padEnds;
  final Color? color;
  final bool? expanded;
  final String? fillStar, star;
  StarRating({
    required this.rating,
    this.starCount = 5,
    this.size = 16.0,
    this.padEnds = 0,
    this.color,
    this.fillStar,
    this.star,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    double remainingRating = rating - fullStars;

    return expanded == false
        ? Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) {
            if (index < fullStars) {
              // Full star
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: padEnds),
                child: Image.asset(
                  fillStar ?? Assets.imagesStar,
                  height: size,
                  color: color ?? null,
                ),
              );
            } else if (index == fullStars && remainingRating > 0) {
              // Partial star
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: padEnds),
                child: Image.asset(
                  fillStar ?? Assets.imagesHalf,
                  height: size,
                  color: color ?? null,
                ),
              );
            } else {
              // Empty star
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: padEnds),
                child: Image.asset(star ?? Assets.imagesOuutline, height: size),
              );
            }
          }),
        )
        : Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) {
            if (index < fullStars) {
              // Full star
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padEnds),
                  child: Image.asset(
                    fillStar ?? Assets.imagesStar,
                    height: size,
                    color: color ?? null,
                  ),
                ),
              );
            } else if (index == fullStars && remainingRating > 0) {
              // Partial star
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padEnds),
                  child: Image.asset(
                    fillStar ?? Assets.imagesHalf,
                    height: size,
                    color: color ?? null,
                  ),
                ),
              );
            } else {
              // Empty star
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padEnds),
                  child: Image.asset(
                    star ?? Assets.imagesOuutline,
                    height: size,
                    //  color: color ?? kGreyColor,
                  ),
                ),
              );
            }
          }),
        );
  }
}

class RatingText extends StatelessWidget {
  const RatingText({super.key, this.hasviews = true, this.size});
  final bool? hasviews;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return AnimatedRow(
      children: [
        MyText(text: ' 5.0', size: size ?? 18, paddingTop: 3, paddingRight: 5),
        CommonImageView(imagePath: Assets.imagesStar, height: size ?? 20),

        if (hasviews == true)
          MyText(text: "(911)", color: kGreyColor, size: 12),
      ],
    );
  }
}
