import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MoveAnimaate extends StatelessWidget {
  const MoveAnimaate({
    super.key,
    required this.child,
    this.duration,
    this.animateY,
  });
  final Widget child;
  final int? duration;
  final bool? animateY;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        // MoveEffect(
        //   duration: Duration(milliseconds: duration ?? 100),
        //   begin: Offset(animateY != true ? 150 : 0, animateY == true ? -40 : 0),
        // ),
      ],
      child: child,
    );
  }
}
