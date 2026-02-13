import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/main.dart';

import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
    required this.isMe,
    required this.otherUserImg,
    required this.otherUserName,
    required this.msgTime,
    required this.msg,
    required this.myImg,
    required this.haveImages,
    required this.images,
  }) : super(key: key);

  final String msg, otherUserName, otherUserImg, msgTime, myImg;
  final bool isMe, haveImages;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return isMe ? _rightMessageBubble() : _leftMessageBubble();
  }

  Widget _rightMessageBubble() {
    return Padding(
      padding: EdgeInsets.only(bottom: 33.13, left: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //   SizedBox(width: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [SizedBox(width: 4)],
                    ),
                    haveImages == true
                        ? Flexible(
                          child: CommonImageView(
                            url: dummyImage,
                            radius: 24,
                            height: 160,
                          ),
                        )
                        : Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 8.17),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.43,
                              vertical: 8.26,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff8A8A8F),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    msg,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: SFPRO,
                                      color: kQuaternaryColor,
                                      height: 1.4,
                                    ),
                                  ),
                                ),

                                // CommonImageView(
                                //   imagePath: Assets.imagesDoubletick,
                                //   height: 12,
                                // ),
                              ],
                            ),
                          ),
                        ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
          MyText(
            text: msgTime,
            size: 10,
            weight: FontWeight.w500,
            //  paddingBottom: 5,
            paddingRight: 10,
            paddingTop: 5,
            color: kGrey5Color,
          ),
        ],
      ),
    );
  }

  Widget _leftMessageBubble() {
    return Padding(
      padding: EdgeInsets.only(bottom: 33.13, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          haveImages == true
              ? Flexible(
                child: CommonImageView(
                  url: dummyImage2,
                  radius: 24,
                  height: 160,
                ),
              )
              : Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonImageView(
                      url: otherUserImg,
                      height: 40,
                      width: 40,
                      radius: 100,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.43,
                          vertical: 12.26,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimary100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                msg,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: SFPRO,
                                  color: kQuaternaryColor,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            MyText(
                              text: msgTime,
                              size: 10,
                              weight: FontWeight.w500,
                              //  paddingBottom: 5,
                            ),
                          ],
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
