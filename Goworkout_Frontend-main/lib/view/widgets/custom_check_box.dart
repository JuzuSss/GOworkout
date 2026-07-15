import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.isActive,
    required this.onTap,
    this.unSelectedColor,
    this.selectedColor,
    this.size,
    this.circleIcon,
    this.hasgrad = false,
    this.iconColor,
    this.radius,
    this.borderColor,
    this.bordercolor2,
    this.circleIconsize,
    this.iscircle,
  }) : super(key: key);
  final bool isActive;
  final VoidCallback onTap;
  Color? unSelectedColor, selectedColor, iconColor, borderColor, bordercolor2;
  bool? iscircle, hasgrad;
  final double? size, radius, circleIconsize;
  final IconData? circleIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 230),
        curve: Curves.easeInOut,
        height: size ?? 12,
        width: size ?? 12,
        decoration:
            hasgrad == true
                ? BoxDecoration(
                  gradient: isActive ? bggradOpacity() : blacktrans(0),
                  borderRadius: BorderRadius.circular(
                    iscircle == true ? 50 : radius ?? 2,
                  ),
                  border: Border.all(
                    width: 1.0,
                    color:
                        isActive
                            ? bordercolor2 ?? ktransparent
                            : borderColor ?? kQuaternaryColor.withOpacity(0.4),
                  ),
                )
                : BoxDecoration(
                  color:
                      isActive
                          ? selectedColor ?? kSecondaryColor
                          : unSelectedColor ?? kQuaternaryColor,
                  border: Border.all(
                    width: 1.0,
                    color:
                        isActive
                            ? bordercolor2 ?? ktransparent
                            : borderColor ?? kTertiaryColor.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(
                    iscircle == true ? 50 : radius ?? 2,
                  ),
                ),
        child:
            !isActive
                ? Icon(circleIcon, size: 16, color: ktransparent) ?? SizedBox()
                : Icon(
                  iscircle == true ? circleIcon ?? Icons.circle : Icons.check,
                  size: circleIconsize ?? 8,
                  color:
                      isActive == true
                          ? iconColor ?? kQuaternaryColor
                          : kQuaternaryColor,
                ),
      ),
    );
  }
}
