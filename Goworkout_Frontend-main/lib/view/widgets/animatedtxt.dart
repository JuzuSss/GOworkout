import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class AnimatedText extends StatefulWidget {
  AnimatedText({
    required this.dollar,
    super.key,
    required this.endCount,
    this.size,
    this.color,
    this.isleft,
    required this.fixednumber,
    this.hasdollor,
  });
  int endCount = 0;
  int fixednumber = 0;
  double? size;
  Color? color;
  bool? hasdollor, isleft;
  String dollar = '\$';
  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _countingAnimation;
  double _currentCount = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // You can adjust the duration
    );

    _countingAnimation = Tween<double>(
      begin: 0,
      end: widget.endCount.toDouble(),
    ).animate(_controller)..addListener(() {
      setState(() {
        _currentCount = _countingAnimation.value;
      });
    });

    _controller.forward();

    _controller.addStatusListener((status) {});
  }

  @override
  Widget build(BuildContext context) {
    return MyText(
      color: widget.color ?? kTertiaryColor,
      weight: FontWeight.bold,
      text:
          widget.hasdollor == true
              ? widget.isleft == true
                  ? widget.dollar +
                      _currentCount.toStringAsFixed(widget.fixednumber)
                  : _currentCount.toStringAsFixed(widget.fixednumber) +
                      widget.dollar
              : _currentCount.toStringAsFixed(widget.fixednumber),
      size: widget.size ?? 16,
      fontFamily: SFPRO,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
