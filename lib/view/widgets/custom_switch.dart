import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final Color? inactiveTrackColor;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? trackOutlineColor;
  final double? trackOutlineWidth;
  final Color? thumbColor;
  final double? scale;
  final EdgeInsetsGeometry? padding;

  const CustomSwitch({
    super.key,
    this.value,
    this.onChanged,
    this.inactiveTrackColor,
    this.activeColor,
    this.activeTrackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbColor,
    this.scale,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 0.5,
      child: Switch(
        value: value ?? false,
        onChanged: onChanged,
        inactiveTrackColor: inactiveTrackColor,
        activeColor: activeColor,
        activeTrackColor: activeTrackColor,
        trackOutlineColor:
            trackOutlineColor != null
                ? WidgetStatePropertyAll(trackOutlineColor ?? kTertiaryColor)
                : null,
        trackOutlineWidth:
            trackOutlineWidth != null
                ? WidgetStatePropertyAll(trackOutlineWidth ?? 3)
                : null,
        thumbColor:
            thumbColor != null
                ? WidgetStatePropertyAll(thumbColor ?? kTertiaryColor)
                : null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        thumbIcon: MaterialStateProperty.all(Icon(null)),
      ),
    );
  }
}
