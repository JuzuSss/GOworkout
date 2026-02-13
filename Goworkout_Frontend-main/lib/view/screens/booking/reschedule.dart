import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/view/screens/booking/booking.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Reschedule extends StatelessWidget {
  const Reschedule({super.key, this.iscoach});
  final bool? iscoach;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Reschedule', centerTitle: T),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: MyCalender(issessions: iscoach == true ? true : false),
          ),
        ],
      ),
    );
  }
}
