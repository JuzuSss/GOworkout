import 'package:flutter/material.dart';

import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/horizontal_calender.dart';
import 'package:go_workout/view/widgets/title_row.dart';

class Sessions extends StatelessWidget {
  const Sessions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      children: [
        AnimatedColumn(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TitleRow(title: 'Session'),
            ),
            SizedBox(height: 10),
            CustomCalendar(),
          ],
        ),
      ],
    );
  }
}
