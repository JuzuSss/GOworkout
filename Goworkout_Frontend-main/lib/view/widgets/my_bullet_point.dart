import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class MyBullet extends StatelessWidget {
  MyBullet({super.key, required this.point, this.size});
  String point;
  double? size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: '•',
            //paddingLeft: 25,
            paddingRight: 10,
          ),
          Expanded(
            child: MyText(text: point, color: kGrey5Color, size: size ?? 14),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
