import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  ExpandableText({required this.text});
  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: widget.text,
          size: 13,
          color: kGrey5Color,
          weight: FontWeight.w500,
          paddingLeft: 0,
          paddingRight: 0,
          maxLines: !_isExpanded ? 2 : 25,
          textOverflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: MyText(
            text: !_isExpanded ? "Read more" : "Show less",
            size: 13,
            color: kBlackColor,

            weight: FontWeight.w600,
            paddingLeft: 0,
            paddingRight: 0,
          ),
        ),
      ],
    );
  }
}
