import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class AnimatedNextButton extends StatefulWidget {
  final VoidCallback ontap;
  final String? btnTxt;
  AnimatedNextButton({Key? key, required this.ontap, this.btnTxt})
    : super(key: key);
  @override
  _AnimatedNextButtonState createState() => _AnimatedNextButtonState();
}

class _AnimatedNextButtonState extends State<AnimatedNextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final double buttonWidth = 170;
  final double buttonHeight = 50;
  final double waveWidth = 300;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildWave(Color color, double delay, double opacity) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final t = (_controller.value + delay) % 1.0;
        final dx = (buttonWidth - waveWidth) * t;

        return Transform.translate(
          offset: Offset(dx + 66, 0),
          child: Opacity(
            opacity: opacity,
            child: Container(
              width: waveWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Bounce(
        onTap: widget.ontap,
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Stack(
                  children: [
                    buildWave(kSecondaryColor, 0.0, 0.3),
                    buildWave(kSecondaryColor, 0.2, 0.5),
                    buildWave(kSecondaryColor, 0.4, 0.7),
                  ],
                ),
              ),
              // Static text on top
              Container(
                alignment: Alignment.center,
                width: buttonWidth,
                height: buttonHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: MyText(
                  text: widget.btnTxt ?? 'Next',
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
