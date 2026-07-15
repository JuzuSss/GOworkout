import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

import '../../constants/app_colors.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.isexpanded,
    this.height,
    this.padEnds,
  });

  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? isexpanded;
  final double? height, padEnds;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

int current = 0;

class _TabsWidgetState extends State<TabsWidget> {
  void _onTap(int index) {
    if (widget.ontap != null) {
      widget.ontap!(index); // Pass index to ontap callback
    } else {
      setState(() {
        current = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isexpanded == false
        ? Container(
          height: widget.height ?? 64,
          margin: EdgeInsets.only(bottom: 0),
          //  decoration: rounded2r(kGrey1Color, ktransparent, 100),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.items.length, (index) {
                    return GestureDetector(
                      onTap: () => _onTap(index), // Call _onTap with the index
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 4,
                        ),
                        child: AnimatedContainer(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          duration: const Duration(milliseconds: 300),
                          height: Get.height,
                          //    width: 30,
                          child: Column(
                            children: [
                              Center(
                                child: MyText(
                                  text: widget.items[index],
                                  paddingLeft: index == 0 ? 16 : 7,
                                  paddingRight: index == 0 ? 16 : 7,
                                  size: 14,
                                  weight:
                                      widget.currentindex == index
                                          ? wsemibold
                                          : wregular,
                                  color:
                                      widget.currentindex == index
                                          ? kSecondaryColor
                                          : kGreyColor,
                                ),
                              ),
                              Container(
                                height: 2,
                                width: Get.width,
                                decoration: rounded2(
                                  widget.currentindex != index
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  widget.currentindex != index
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
          child: Container(
            height: widget.height ?? 64,
            margin: EdgeInsets.only(bottom: 0),
            //   decoration: rounded2r(kGrey1Color, kGrey1Color, 100),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: List.generate(widget.items.length, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap:
                              () => _onTap(index), // Call _onTap with the index
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 4,
                            ),
                            child: AnimatedContainer(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              duration: const Duration(milliseconds: 300),
                              height: Get.height,
                              //    width: 30,
                              child: Column(
                                children: [
                                  Center(
                                    child: MyText(
                                      paddingBottom: 10,
                                      text: widget.items[index],
                                      paddingLeft: index == 0 ? 16 : 7,
                                      paddingRight: index == 0 ? 16 : 7,
                                      size: 14,
                                      weight:
                                          widget.currentindex == index
                                              ? wsemibold
                                              : wregular,
                                      color:
                                          widget.currentindex == index
                                              ? kSecondaryColor
                                              : kGreyColor,
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    width: Get.width,
                                    decoration: rounded2(
                                      widget.currentindex != index
                                          ? kPrimaryColor
                                          : kSecondaryColor,
                                      widget.currentindex != index
                                          ? kPrimaryColor
                                          : kSecondaryColor,
                                    ),
                                  ),
                                ],
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

class MyTabbar extends StatelessWidget {
  const MyTabbar({
    super.key,
    required this.items,
    this.controller,
    this.bgcolor,
    this.tabcolor,
    this.outlinecolor,
    this.labelcolor,
    this.unselectedLabelcolor,
    this.indicatorcolor,
    this.indicatorPads,
    this.padEnds,
    this.ontap,
    this.isscrollcontrolled,
    this.tabAlignment,
  });
  final void Function(int)? ontap;
  final List<String> items;
  final TabController? controller;
  final double? indicatorPads, padEnds;
  final Color? bgcolor,
      tabcolor,
      outlinecolor,
      labelcolor,
      unselectedLabelcolor,
      indicatorcolor;
  final bool? isscrollcontrolled;
  final TabAlignment? tabAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,

      // decoration: rounded2r(
      //   bgcolor ?? kGrey1Color,
      //   bgcolor ?? kGrey1Color,
      //   100,
      // ),
      child: TabBar(
        automaticIndicatorColorAdjustment: false,
        labelColor: labelcolor ?? kSecondaryColor,

        unselectedLabelColor: unselectedLabelcolor ?? kGreyColor,
        controller: controller,
        onTap: ontap,
        overlayColor: WidgetStatePropertyAll(ktransparent),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: SFPRO,
          color: labelcolor ?? kPrimaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: SFPRO,
          color: kTextColor4,
        ),
        isScrollable: isscrollcontrolled ?? false,
        tabAlignment: tabAlignment ?? null,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.symmetric(horizontal: indicatorPads ?? 30),
        labelPadding: EdgeInsets.symmetric(horizontal: padEnds ?? 20),
        // controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,

        // indicator: rounded2r(
        //   tabcolor ?? kTertiaryColor,
        //   outlinecolor ?? kTertiaryColor,
        //   100,
        // ),
        dividerColor: ktransparent,

        indicatorColor: indicatorcolor ?? kSecondaryColor,
        //      labelPadding: EdgeInsets.symmetric(horizontal: 3),
        tabs: List.generate(
          items.length,
          (index) => Tab(iconMargin: EdgeInsets.all(0), text: items[index].tr),
        ),
      ),
    );
  }
}
