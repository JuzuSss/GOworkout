import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';

class MediaIcon extends StatelessWidget {
  final String? path;
  final int? duration;
  const MediaIcon({super.key, this.path, this.duration});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        //MoveEffect(duration: Duration(milliseconds: duration ?? 100))
      ],
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: circle(ktransparent, kQuaternaryColor),
        child: Center(
          child: CommonImageView(
            imagePath: path ?? Assets.imagesLogo,
            height: 24,
          ),
        ),
      ),
    );
  }
}
