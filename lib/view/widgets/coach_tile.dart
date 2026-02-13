import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';

import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/home/coach_pofile.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/custom_row.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_ratings.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class CoachTile extends StatelessWidget {
  final String? path;
  const CoachTile({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Get.to(() => CoachPofile());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: roundedr(kPrimary100, 20),
        child: AnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FollowTile(path: path ?? dummyImage),
            CustomRow(
              left: '   Next Availability',
              right: '',
              hasRight: false,
              padvertical: 5,
              colorLeft: kQuaternaryColor,
              padends: 0,
              rightIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: roundedr(kSecondaryColor, 100),
                child: PriceText(
                  info: '\$21',
                  title: '/hr',
                  color2: kQuaternaryColor,
                  fontWeight2: wbold,
                  fontWeight: wlight,
                  size1: 20,
                  color: kQuaternaryColor,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),
              child: AnimatedRow(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 0),
                    child: MoveAnimaate(
                      duration: 300 + index * 200,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: roundedr(kPrimaryColor, 100),
                        child: Center(
                          child: MyText(
                            text: 'Today 15:00',
                            color: kGrey5Color,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FollowTile extends StatelessWidget {
  const FollowTile({super.key, this.path});
  final String? path;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CommonImageView(
          url: path ?? dummyImage,
          height: 59,
          width: 59,
          radius: 200,
        ),
        Expanded(
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(text: 'Jordan Rivers', size: 18, weight: wbold),
              IconTextRow(
                expanded: false,
                iconpath: Assets.imagesMaker,
                iconcolor: kGrey5Color,
                text: 'Paris',
                iconsize: 12,
              ),
            ],
          ),
        ),
        Column(
          children: [
            RatingText(hasviews: false),
            MyText(text: '(113+)', color: kGrey5Color),
          ],
        ),
      ],
    );
  }
}

final List<String> images = [
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  'https://images.unsplash.com/photo-1535579710123-3c0f261c474e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXRzfGVufDB8fDB8fHww',
  'https://images.unsplash.com/photo-1629747490241-624f07d70e1e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydHJhaXRzfGVufDB8fDB8fHww',
  'https://images.unsplash.com/photo-1519744434498-a0de604df9db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cG9ydHJhaXRzfGVufDB8fDB8fHww',
  // 'https://plus.unsplash.com/premium_photo-1710548651184-5eb2b115fe80?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHBvcnRyYWl0c3xlbnwwfHwwfHx8MA%3D%3D',
  'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXRzfGVufDB8fDB8fHww',
  // 'https://unsplash.com/photos/smiling-woman-wearing-white-and-black-pinstriped-collared-top-QXevDflbl8A',
  'https://images.unsplash.com/photo-1598198414976-ddb788ec80c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTEwfHxwb3J0cmFpdHN8ZW58MHx8MHx8fDA%3D',
  //
  'https://i.mydramalist.com/ZyyEJ_5c.jpg',
];
