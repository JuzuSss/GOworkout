import 'package:flutter/material.dart';
import 'package:go_workout/generated/assets.dart';
import 'dart:math';

class MovingIcon extends StatefulWidget {
  final String? path;
  final double? height;
  final bool? isroatating;
  final int? secDuration;
  final Color? color;
  const MovingIcon({
    super.key,
    this.path,
    this.height,
    this.isroatating = false,
    this.secDuration,
    this.color,
  });

  @override
  State<MovingIcon> createState() => _MovingIconState();
}

class _MovingIconState extends State<MovingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _verticalAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: widget.secDuration ?? 2),
      vsync: this,
    )..repeat(reverse: true);

    // Vertical movement animation
    _verticalAnimation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // 3D Rotation animation (left-right flip effect)
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset:
              widget.isroatating == true
                  ? Offset(0, 10)
                  : Offset(0, _verticalAnimation.value), // Vertical movement
          child:
              widget.isroatating == true
                  ? Transform(
                    transform: Matrix4.rotationY(
                      _rotationAnimation.value,
                    ) // Left-right 3D flip
                    ..setEntry(
                      3,
                      2,
                      0.009,
                    ), // Perspective effect for enhanced 3D look
                    alignment: Alignment.center,
                    child: child,
                  )
                  : child,
        );
      },
      child: Image.asset(
        fit: BoxFit.contain,
        widget.path ?? Assets.imagesLogo,
        color: widget.color ?? null,
        height: widget.height ?? 120,
      ),
    );
  }
}
