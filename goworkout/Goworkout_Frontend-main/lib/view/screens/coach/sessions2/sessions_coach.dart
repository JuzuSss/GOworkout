import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/screens/booking/booking.dart';
import 'package:go_workout/view/screens/booking/my_bookings.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/booking_tile.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/title_row.dart';

class SessionsCoach extends StatelessWidget {
  const SessionsCoach({super.key});

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
              child: TitleRow(
                title: 'Current Bookings',
                onseeallTap: () {
                  Get.to(() => MyBookings(iscoach: true));
                },
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(images.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 8.0,
                      left: index == 0 ? 16 : 0,
                    ),
                    child: SizedBox(
                      width: 313,
                      child: BookingTile(path: images[index], iscoach: true),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            Container(color: kPrimary100, child: MyCalender(issessions: true)),
          ],
        ),
      ],
    );
  }
}
