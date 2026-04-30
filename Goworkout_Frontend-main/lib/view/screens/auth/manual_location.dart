import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class ManualLocation extends StatefulWidget {
  const ManualLocation({super.key});

  @override
  State<ManualLocation> createState() => _ManualLocationState();
}

class _ManualLocationState extends State<ManualLocation> {
  Offset? _markerPosition;
  final TextEditingController _addressCtrl =
      TextEditingController(text: 'New York, NY, USA');

  @override
  void dispose() {
    _addressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        actions: [
          MyButton(
            onTap: () {
              Get.snackbar(
                'Location',
                'Saved: ${_addressCtrl.text}',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: kPrimary100,
                colorText: kQuaternaryColor,
              );
              Future.delayed(
                const Duration(milliseconds: 600),
                () => Get.back(),
              );
            },
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
          LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(constraints.maxWidth, constraints.maxHeight);
              final marker = _markerPosition ??
                  Offset(size.width / 2, size.height / 2);
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (details) {
                  setState(() => _markerPosition = details.localPosition);
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      child: CommonImageView(
                        imagePath: Assets.imagesMap,
                        width: size.width,
                        height: size.height,
                      ),
                    ),
                    Positioned(
                      left: marker.dx - 15,
                      top: marker.dy - 30,
                      child: CommonImageView(
                        imagePath: Assets.imagesMaker,
                        height: 30,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 24,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kPrimary100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Selected location',
                              size: 12,
                              color: kGrey5Color,
                              paddingBottom: 6,
                            ),
                            TextField(
                              controller: _addressCtrl,
                              style: const TextStyle(color: kQuaternaryColor),
                              decoration: const InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'Type an address...',
                                hintStyle: TextStyle(color: kGrey5Color),
                              ),
                            ),
                            const Divider(color: kGrey5Color, height: 16),
                            MyText(
                              text:
                                  'Tap anywhere on the map to set the marker, then save.',
                              size: 11,
                              color: kGrey5Color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.snackbar(
            'Location',
            'Centering on your position...',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kPrimary100,
            colorText: kQuaternaryColor,
          );
          setState(() => _markerPosition = null);
        },
        child: CommonImageView(imagePath: Assets.imagesDirection, height: 70),
      ),
    );
  }
}
