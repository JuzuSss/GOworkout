import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.heading,
    required this.hint,
    required this.items,
    this.genderIcon,
    this.selectedValue,
    this.onChanged,
    this.bgColor,
    this.marginBottom,
    this.haveHeading = true,
    this.width,
    this.headingWeight,
    this.headingColor,
    this.itemTextColor,
    this.itemTextSize = 12.0,
    this.dropdownIcon,
    this.padding,
    this.padEnds,
    this.padVertical,
    this.iconSize = 20.0,
    this.hintSize = 12.0,
    this.labelSize = 12.0,
    this.buttonHeight = 24.0,
    this.menuItemHeight = 48.0,
    this.buttonPadding = const EdgeInsets.symmetric(horizontal: 15),
  });

  final List<dynamic>? items;
  String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String heading, hint;
  Color? bgColor, headingColor, itemTextColor;
  double? marginBottom, width, itemTextSize, padEnds, padVertical;
  bool? haveHeading;
  FontWeight? headingWeight;
  Widget? dropdownIcon;
  Widget? genderIcon;
  EdgeInsetsGeometry? padding;
  double? iconSize, hintSize, labelSize, textSize, buttonHeight, menuItemHeight;
  EdgeInsetsGeometry buttonPadding;

  @override
  Widget build(BuildContext context) {
    // Define the icon based on selected value

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (haveHeading!)
          MyText(
            text: heading,
            size: labelSize,
            paddingTop: 10,
            color: headingColor ?? kGrey5Color,
            paddingBottom: 10,
            paddingLeft: 10,
            weight: headingWeight ?? FontWeight.w500,
          ),
        Animate(
          effects: [
            // MoveEffect(
            //   begin: Offset(50, 0),
            //   duration: Duration(milliseconds: 300),
            // ),
          ],
          child: Padding(
            padding: EdgeInsets.only(bottom: marginBottom ?? 16),
            child: GestureDetector(
              onTap: () {
                if (items != null && items!.isNotEmpty) {
                  onChanged?.call(items!.first);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor ?? ktransparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: kGrey5Color, width: 1),
                ),
                child: Row(
                  children: [
                    genderIcon ?? SizedBox(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DropdownButtonHideUnderline(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: padEnds ?? 0,
                                vertical: padVertical ?? 12,
                              ),
                              child: DropdownButton2(
                                items:
                                    items!
                                        .map(
                                          (item) => DropdownMenuItem<dynamic>(
                                            value: item,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: MyText(
                                                        paddingTop: 10,
                                                        text: item,
                                                        size:
                                                            itemTextSize ?? 16,
                                                        color:
                                                            itemTextColor ??
                                                            kQuaternaryColor,
                                                        weight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 18),
                                                if (item != 'National')
                                                  Divider(
                                                    height: 0,
                                                    thickness: 0.6,
                                                    color: kGrey5Color,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                value: selectedValue,
                                onChanged: onChanged,
                                iconStyleData: IconStyleData(
                                  icon:
                                      dropdownIcon ??
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: kQuaternaryColor,
                                        size: 18,
                                      ),
                                ),
                                isDense: true,
                                isExpanded: true,
                                customButton: Container(
                                  height: buttonHeight,
                                  padding: buttonPadding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: MyText(
                                          paddingLeft: 0,
                                          text:
                                              selectedValue == null
                                                  ? hint
                                                  : selectedValue ?? '',
                                          size: hintSize,
                                          color: itemTextColor ?? kGreyColor,
                                          paddingBottom:
                                              haveHeading == false ? 0 : 0,
                                        ),
                                      ),
                                      // dropdownIcon ??
                                      //     Image.asset(
                                      //       Assets.imagesLogo,
                                      //       height: iconSize,
                                      //       color: ktransparent,
                                      //     ),
                                    ],
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  elevation: 5,
                                  width: Get.width * 0.9,
                                  maxHeight: 300,
                                  offset: Offset(0, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kPrimary100,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    color: kPrimary100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: kQuaternaryColor,
                      size: iconSize ?? 18,
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SimpleDropDown extends StatelessWidget {
  SimpleDropDown({
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.width,
    this.header,
  });

  final List<dynamic>? items;
  String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  double? width;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: kQuaternaryColor,
        highlightColor: kQuaternaryColor,
      ),
      child: Container(
        decoration: rounded2r(kQuaternaryColor, kQuaternaryColor, 36),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: List.generate(items!.length, (index) {
              return DropdownMenuItem<dynamic>(
                value: items![index],
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: items![index],
                        size: 12,
                        weight: FontWeight.w600,
                        color: kTertiaryColor,
                      ),
                    ),
                    if (selectedValue == items![index])
                      Icon(Icons.check, color: kSecondaryColor, size: 18),
                  ],
                ),
              );
            }),
            value: selectedValue,
            onChanged: onChanged,
            isDense: true,
            isExpanded: false,
            customButton: header,
            menuItemStyleData: MenuItemStyleData(height: 38),
            dropdownStyleData: DropdownStyleData(
              elevation: 3,
              width: width,
              maxHeight: 300,
              offset: Offset(0, -5),
              decoration: BoxDecoration(
                border: Border.all(color: kQuaternaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(16),
                color: kQuaternaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
