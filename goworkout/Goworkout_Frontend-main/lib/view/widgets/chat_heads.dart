import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/chat/chat_screen.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ChatHeads extends StatelessWidget {
  const ChatHeads({super.key, this.url, this.isread, this.duration});
  final String? url;
  final bool? isread;
  final int? duration;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        // ShimmerEffect(
        //   color: kQuaternaryColor.withOpacity(0.2),
        //   //delay: Duration(milliseconds: 1000),
        // ),
        // MoveEffect(
        //   duration: Duration(milliseconds: duration ?? 300),
        //   begin: Offset(100, 0),
        // ),
      ],
      child: Bounce(
        onTap: () {
          Get.to(() => ChatScreen());
        },
        child: Container(
          decoration: rounded(ktransparent),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            //color: kPrimary100,
            child: Slidable(
              closeOnScroll: false,
              key: const ValueKey(0),
              endActionPane: ActionPane(
                extentRatio: 0.16,
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  Expanded(
                    child: Container(
                      color: kRedColor,
                      child: Center(
                        child: CommonImageView(
                          imagePath: Assets.imagesDelete,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  AnimatedRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CommonImageView(
                            url: url ?? dummyImage,
                            height: 52,
                            width: 45,
                            radius: 100,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CommonImageView(
                              imagePath: Assets.imagesActive,
                              height: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: 'Lucas Klein',
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                            MyText(
                              text: 'Lorem ipsum dolor sit amet',
                              size: 12,
                              maxLines: 1,

                              textOverflow: TextOverflow.ellipsis,
                              color: kGrey5Color,
                            ),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyText(
                            paddingRight: 20,
                            text: '10:30 Pm',
                            paddingLeft: 5,
                            size: 10,
                            paddingBottom: 10,
                            color: kGrey5Color,
                          ),
                          if (isread == true)
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              decoration: circle(
                                kSecondaryColor,
                                kSecondaryColor,
                              ),
                              height: 18,
                              width: 18,
                              child: Center(
                                child: MyText(
                                  size: 8,
                                  text: '01',
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, top: 10),
                    child: Divider(color: kPrimary100, height: 0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
