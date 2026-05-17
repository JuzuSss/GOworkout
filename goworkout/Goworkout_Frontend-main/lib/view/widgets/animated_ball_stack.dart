import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';

class AnimatedBallStack extends StatelessWidget {
  const AnimatedBallStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -40,
          child: Animate(
            effects: [
              // MoveEffect(
              //   begin: Offset(200, 590),
              //   duration: Duration(seconds: 1),
              // ),
              //  RotateEffect(duration: Duration(seconds: 3), begin: 4),
            ],
            child: CommonImageView(imagePath: Assets.imagesBall, height: 200),
          ),
        ),
        Container(),
      ],
    );
  }
}
