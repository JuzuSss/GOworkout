import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/custom_bottom_sheet.dart';
import 'package:go_workout/view/widgets/custom_row.dart';
import 'package:go_workout/view/widgets/custom_switch.dart';
import 'package:go_workout/view/widgets/custom_wrap.dart';
import 'package:go_workout/view/widgets/menu_tile.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt currentindex = 0.obs;
    SfRangeValues _values = SfRangeValues(0.0, 100.0);
    return CustomBottomSheet(
      padends: 0,
      bgcolor: kPrimaryColor,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonImageView(imagePath: Assets.imagesClose, height: 24),
              MyText(text: 'Search Filter'),
              MyText(text: 'Reset'),
            ],
          ),
        ),
        Divider(color: kPrimary100),
        CustomRow(
          left: 'Price per session',
          right: '\$00-\$1000',
          padvertical: 0,
        ),
        SfRangeSlider(
          min: 0.0,
          max: 100.0,
          values: _values,
          interval: 20,
          showTicks: false,
          showLabels: false,
          inactiveColor: kPrimary100,
          activeColor: kQuaternaryColor,
          shouldAlwaysShowTooltip: false,
          startThumbIcon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
              border: Border.all(width: 1.5, color: kQuaternaryColor),
            ),
          ),
          endThumbIcon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
              border: Border.all(width: 1.5, color: kQuaternaryColor),
            ),
          ),
          enableTooltip: true,
          minorTicksPerInterval: 1,
          onChanged: (SfRangeValues values) {
            _values = values;
          },
        ),
        Divider(color: kPrimary100),
        MyText(
          text: 'Rating',
          weight: wsemibold,
          size: 16,
          paddingLeft: 20,
          paddingBottom: 10,
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomWrap(
              ontap: (index) {
                currentindex.value = index;
              },
              hasicon: true,
              currentindex: currentindex.value,
              items: ['Any', '2.5+', '3.5+', '4.5+', '5'],
            ),
          ),
        ),
        Divider(color: kPrimary100),
        MyText(
          text: 'Sort by',
          weight: wsemibold,
          size: 16,
          paddingLeft: 20,
          paddingBottom: 10,
        ),
        Menutile(
          hasicon: false,
          title: 'Lowest to highest price',
          textcolor: kQuaternaryColor,
        ),
        SizedBox(height: 20),
        Divider(color: kPrimary100),
        MyText(
          text: 'Availability',
          weight: wsemibold,
          size: 16,
          paddingLeft: 20,
          paddingBottom: 0,
        ),
        SizedBox(
          child: Menutile(
            hasicon: false,
            title: 'Available Today',
            textcolor: kQuaternaryColor,
            hasline: false,
            trailing: CustomSwitch(
              scale: 0.9,
              value: false,
              thumbColor: kTertiaryColor,
              activeColor: kSecondaryColor,
              activeTrackColor: kSecondaryColor,
            ),
          ),
        ),
        MyButton(
          onTap: () {},
          buttonText: 'Apply Changes',
          mhoriz: 20,
          mBottom: 30,
          backgroundColor: kQuaternaryColor,
          fontColor: kBlack2Color,
        ),
      ],
    );
  }
}
