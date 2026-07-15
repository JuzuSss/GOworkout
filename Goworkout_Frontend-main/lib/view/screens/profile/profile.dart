import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/coach/transaction_coach.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/screens/profile/about_us.dart';
import 'package:go_workout/view/screens/profile/chage_pass.dart';
import 'package:go_workout/view/screens/profile/edit_profile.dart';
import 'package:go_workout/view/screens/profile/help.dart';
import 'package:go_workout/view/screens/profile/myfollowing.dart';
import 'package:go_workout/view/screens/profile/transanctions.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_dialog.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, this.iscoach});
  final bool? iscoach;
  @override
  Widget build(BuildContext context) {
    List<dynamic> menuItems = [
      {
        'icon': Assets.imagesLove,
        'title': 'Favorite/Following',
        'onTap': () {
          Get.to(
            () => Myfollowing(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 300),
          );
        },
      },
      {
        'icon': Assets.imagesTansanction,
        'title': 'Transaction',
        'onTap': () {
          if (iscoach == true) {
            Get.to(
              () => TransactionCoach(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          } else {
            Get.to(
              () => Transanctions(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          }
        },
      },
      {
        'icon': Assets.imagesChangepass,
        'title': 'Change Password',
        'onTap': () {
          Get.to(
            () => ChagePass(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 300),
          );
        },
      },
      {
        'icon': Assets.imagesHelp,
        'title': 'Help',
        'onTap': () {
          Get.to(
            () => Help(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 300),
          );
        },
      },
      {
        'icon': Assets.imagesAbout,
        'title': 'About Us',
        'onTap': () {
          Get.to(
            () => AboutUs(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 300),
          );
        },
      },
    ];

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(isfexiblespace: false),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CommonImageView(
                      height: 100,
                      width: 100,
                      radius: 300,
                      url: images[7],
                    ),
                  ),
                  MyText(
                    text: 'Barbara Haque',
                    size: 16,
                    weight: wsemibold,
                    textAlign: TextAlign.center,
                  ),
                  MyText(
                    text:
                        'A passionate basketball coach with over a decade of experience in developing young talent.',
                    textAlign: TextAlign.center,
                    paddingLeft: 30,
                    paddingRight: 30,
                    color: kGrey5Color,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      MyButton(
                        onTap: () {
                          Get.dialog(
                            CustomDialog(
                              height: 0,
                              title: 'Are you sure?',
                              btncolor: ktransparent,
                              outline1color: kQuaternaryColor,
                              btntext: 'Cancel',
                              btntext2: 'Delete',

                              subtitle: 'You want to delete this chat?',
                            ),
                          );
                        },
                        padends: 8,
                        buttonText: 'Delete Account',
                        height: 35,
                        fontSize: 14,
                        backgroundColor: ktransparent,
                        outlineColor: kQuaternaryColor,
                      ),
                      MyButton(
                        onTap: () {
                          Get.to(() => EditProfile());
                        },
                        buttonText: 'Edit Profile',
                        fontSize: 14,
                        backgroundColor: kQuaternaryColor,
                        fontColor: kTertiaryColor,
                        height: 35,
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: menuItems.length,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20,
                        ),
                        child: MoveAnimaate(
                          duration: 300 * index + 200,
                          child: IconTitleSubtitle(
                            path: item['icon'],
                            title: item['title'],
                            ontap: item['onTap'],
                            size1: 16,
                            weight1: wregular,
                            color1: kQuaternaryColor,
                            trailing: CommonImageView(
                              imagePath: Assets.imagesRight2,
                              height: 20,
                            ),
                            padEnds: 16,
                            padVertical: 16,
                            decoration: roundedr(kPrimary100, 9),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
