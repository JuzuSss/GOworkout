import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/view/screens/booking/mybokings_body.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/tabs_widget.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({super.key, this.iscoach});
  final bool? iscoach;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: simpleAppBar(
          title: 'My Bookings',
          centerTitle: T,
          bottom: MyTabbar(
            items: ['Upcoming', 'Previous'],
            isscrollcontrolled: true,
            tabAlignment: TabAlignment.center,
            indicatorPads: 0,
          ),
          bottomheight: 40,
        ),
        body: TabBarView(
          children: [
            MybokingsBody(iscoach: iscoach),
            MybokingsBody(isUpcomig: F, iscoach: iscoach),
          ],
        ),
      ),
    );
  }
}
