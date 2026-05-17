import 'package:flutter/material.dart';
import 'package:go_workout/view/screens/coach/home_c/dashboard_coach.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class AllRequests extends StatelessWidget {
  const AllRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(centerTitle: true, title: 'New Requests'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: images.length,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: MoveAnimaate(
                          duration: 300 + index * 200,
                          child: RequestTile(path: images[index]),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
