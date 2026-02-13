import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedRow extends StatelessWidget {
  const AnimatedRow({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize,
    this.textBaseline,
    this.textDirection,
    this.spacing,
    this.verticalDirection = VerticalDirection.down,
  });
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double? spacing;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        // MoveEffect(
        //     duration: Duration(
        //       milliseconds: 400,
        //     ),
        //     begin: Offset(20, 0))
      ],
      child: Row(
        spacing: spacing ?? 0,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        children: children,
      ),
    );
  }
}
