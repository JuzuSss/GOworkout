import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/booking/booking.dart';
import 'package:go_workout/view/screens/chat/chats.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/screens/profile/profile.dart';
import 'package:go_workout/view/screens/search/discover.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, this.currentIndex = 0});
  int? currentIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List<Map<String, dynamic>> items;
  // int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    updateItems();
  }

  void updateItems() {
    items = [
      {
        'image':
            widget.currentIndex == 0
                ? Assets.imagesHome
                : Assets.imagesOutlinehome,
        'label': 'Home'.tr,
      },
      {
        'image':
            widget.currentIndex == 1
                ? Assets.imagesFillsearch
                : Assets.imagesSearch2,
        'label': 'Discover'.tr,
      },
      {
        'image':
            widget.currentIndex == 2
                ? Assets.imagesFillbook
                : Assets.imagesBook,
        'label': 'Booking'.tr,
      },
      {
        'image':
            widget.currentIndex == 3
                ? Assets.imagesFillchat
                : Assets.imagesInbox,
        'label': 'Inbox'.tr,
      },
      {
        'image':
            widget.currentIndex == 4
                ? Assets.imagesFillprofile
                : Assets.imagesProfile,
        'label': 'Profile'.tr,
      },
    ];
  }

  final List<Widget> screens = [
    Home(),
    Discover(),
    Booking(),
    const Chats(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens[widget.currentIndex!],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        height: Platform.isIOS ? null : 62,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.10),
              offset: const Offset(0, 0),
              blurRadius: 20,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
              log(widget.currentIndex.toString());
              updateItems(); // Update items when index changes
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex!,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(
            height: 2,
            fontFamily: SFPRO,
            color: kSecondaryColor,
            fontWeight: wsemibold,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: SFPRO,
            height: 2,
            color: kGrey8Color,
          ),
          selectedItemColor: kQuaternaryColor,
          unselectedItemColor: kGrey5Color,
          items: List.generate(items.length, (index) {
            return BottomNavigationBarItem(
              tooltip: 'ss',
              activeIcon: CommonImageView(
                imagePath: items[index]['image'],
                width: 24,
              ),
              icon: CommonImageView(
                imagePath: items[index]['image'],
                width: 24,
              ),
              label: items[index]['label'],
            );
          }),
        ),
      ),
    );
  }
}
