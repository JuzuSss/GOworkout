import 'package:flutter/material.dart';

/// Paints the white bar with a concave notch at the active index.
class _NavBarPainter extends CustomPainter {
  final int activeIndex;
  _NavBarPainter(this.activeIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final double w = size.width;
    final double h = size.height;
    final double notchRadius = 38;
    // compute center of notch for 4 items
    final double centerX = w / 4 * activeIndex + w / 7.5;

    final Path path = Path()..moveTo(0, 0);
    // line to just before notch
    path.lineTo(centerX - notchRadius - 34, 0);
    // small curve in
    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius + 6,
      8,
    );
    // main concave arc
    path.arcToPoint(
      Offset(centerX + notchRadius - 12, 8),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    // curve back out
    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius + 30,
      0,
    );
    // finish top edge
    path.lineTo(w, 0);
    // down right edge
    path.lineTo(w, h);
    // bottom edge
    path.lineTo(0, h);
    path.close();

    // drop shadow
    canvas.drawShadow(path, Colors.black26, 3, true);
    // fill
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _NavBarPainter old) {
    return old.activeIndex != activeIndex;
  }
}

/// Your Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatelessWidget {
  /// 0–3
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),

        child: SizedBox(
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // background shape
              Positioned.fill(
                child: CustomPaint(painter: _NavBarPainter(currentIndex)),
              ),
              // icons row
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Center(
                  heightFactor: 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (i) {
                      IconData icon;
                      switch (i) {
                        case 0:
                          icon = Icons.home_outlined;
                          break;
                        case 1:
                          icon = Icons.calendar_today_outlined;
                          break;
                        case 2:
                          icon = Icons.chat_bubble_outline;
                          break;
                        default:
                          icon = Icons.person_outline;
                      }
                      final bool active = i == currentIndex;
                      return GestureDetector(
                        onTap: () => onTap(i),
                        behavior: HitTestBehavior.translucent,
                        child:
                            active
                                ? Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          height: 10,
                                          width: 10,
                                          // the floating circle
                                          //   padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Icon(icon),
                                      ],
                                    ),
                                  ],
                                )
                                : Icon(icon, color: Colors.grey[600], size: 28),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
