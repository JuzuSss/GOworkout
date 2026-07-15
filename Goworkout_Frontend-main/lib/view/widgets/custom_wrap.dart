import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class CustomWrap extends StatelessWidget {
  const CustomWrap({
    super.key,
    required this.currentindex,
    this.ontap,
    required this.items,
    this.hasicon = true,
    this.hasstar = true,
    this.outlinecolor,
  });
  final int currentindex;
  final void Function(int)? ontap; // Allow ontap to receive the index
  final List<String> items;
  final bool? hasicon, hasstar;
  final Color? outlinecolor;
  @override
  Widget build(BuildContext context) {
    RxInt current = 0.obs;
    void _onTap(int index) {
      if (ontap != null) {
        ontap!(index); // Pass index to ontap callback
      } else {
        current.value = index;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        //   clipBehavior: Clip.none,
        spacing: 6, // Horizontal space between the tags
        runSpacing: 6, // Vertical space between the lines of tags
        children: List.generate(items.length, (index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _onTap(index), // Call _onTap with the index
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  child: AnimatedContainer(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    duration: const Duration(milliseconds: 300),

                    decoration: rounded2r(
                      currentindex == index ? kSecondaryColor : ktransparent,
                      currentindex == index
                          ? kSecondaryColor
                          : outlinecolor ?? kPrimary100,
                      100,
                    ),
                    //    width: 30,
                    child: Center(
                      child: Row(
                        children: [
                          if (hasicon == true)
                            if (index != 0)
                              CommonImageView(
                                imagePath: Assets.imagesStar,
                                height: 15,
                              ),
                          MyText(
                            text: items[index],
                            paddingLeft: index == 0 ? 16 : 7,
                            paddingRight: index == 0 ? 16 : 7,
                            size: 14,
                            weight:
                                currentindex == index ? wsemibold : wregular,
                            color:
                                currentindex == index
                                    ? kQuaternaryColor
                                    : kGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
