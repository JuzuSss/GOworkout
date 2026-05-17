import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/screens/booking/mybokings_body.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Myfollowing extends StatelessWidget {
  const Myfollowing({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasfollow = true;
    return Scaffold(
      appBar: simpleAppBar(title: 'My Following', centerTitle: T),
      body:
          hasfollow == false
              ? Center(
                child: NoItems(
                  title: 'No Fav/Following',
                  subtitle: 'You have no favorites/following',
                  hasbutton: true,
                ),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListView.builder(
                          itemCount: images.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          itemBuilder:
                              (context, index) => MoveAnimaate(
                                animateY: true,
                                duration: 300 * index + 200,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.all(13),
                                  decoration: roundedr(kPrimary100, 20),
                                  child: FollowTile(path: images[index]),
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
