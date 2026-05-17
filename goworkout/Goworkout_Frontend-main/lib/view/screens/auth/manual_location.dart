import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:super_tooltip/super_tooltip.dart';

class ManualLocation extends StatelessWidget {
  const ManualLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        actions: [
          MyButton(
            onTap: () {},
            buttonText: 'Save',
            height: 32,
            mhoriz: 16,
            fontSize: 14,
            mTop: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: CommonImageView(
              imagePath: Assets.imagesMap,
              width: Get.width,
              height: Get.height,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: SuperTooltip(
                barrierColor: ktransparent,
                shadowColor: kGreyColorLight,
                //  bottom: 20,
                borderColor: ktransparent,
                hideTooltipOnBarrierTap: true,
                backgroundColor: kSecondaryColor,
                popupDirection: TooltipDirection.up,
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      text: "Set Location",

                      color: kQuaternaryColor,
                      weight: FontWeight.w500,
                    ),
                    Icon(Icons.keyboard_arrow_right, color: kQuaternaryColor),
                  ],
                ),
                child: CommonImageView(
                  imagePath: Assets.imagesMaker,
                  height: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CommonImageView(
        imagePath: Assets.imagesDirection,
        height: 70,
      ),
    );
  }
}
