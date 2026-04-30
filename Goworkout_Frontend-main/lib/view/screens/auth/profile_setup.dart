import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/constants/constants.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/auth/set_location.dart';
import 'package:go_workout/view/widgets/animated_ball_stack.dart';
import 'package:go_workout/view/widgets/auth_header.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_drop_down.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBallStack(),
          Scaffold(
            backgroundColor: ktransparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      MyText(
                        text: 'Set Your Profile',
                        size: 28,
                        weight: FontWeight.bold,
                        paddingTop: 100,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Set up your profile and showcase your skill level ',
                              style: simpletxtStyle,
                            ),
                            TextSpan(
                              text: ' skill level',
                              style: secondarytxtstyle,
                            ),
                            TextSpan(
                              text: 'and photo to start connecting',
                              style: simpletxtStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 48),
                      PhotoStack(),
                      MyText(
                        text: 'Upload Your Photo',
                        textAlign: TextAlign.center,
                        size: 18,
                        weight: wmedium,
                        paddingTop: 10,
                      ),
                      CustomDropDown(
                        hint: "Select Player Level",
                        heading: '',
                        items: const [
                          'Particular',
                          'Club',
                          'Departmental',
                          'Regional',
                          'National',
                          'International',
                        ],
                        onChanged: (v) {},
                      ),
                      MyButton(
                        onTap: () {
                          Get.to(() => SetLocation());
                        },
                        buttonText: 'Save Changes',
                        mTop: 20,
                        mBottom: 34,
                      ),
                    ],
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

class PhotoStack extends StatefulWidget {
  final bool? isattach;
  const PhotoStack({super.key, this.isattach});

  @override
  State<PhotoStack> createState() => _PhotoStackState();
}

class _PhotoStackState extends State<PhotoStack> {
  late bool _hasPhoto;

  @override
  void initState() {
    super.initState();
    _hasPhoto = widget.isattach == true;
  }

  void _pickPhoto() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: kPrimary100,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.photo_camera_outlined,
                color: kQuaternaryColor,
              ),
              title: MyText(text: 'Take Photo'),
              onTap: () {
                Get.back();
                setState(() => _hasPhoto = true);
                Get.snackbar(
                  'Photo',
                  'Photo captured.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: kPrimary100,
                  colorText: kQuaternaryColor,
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library_outlined,
                color: kQuaternaryColor,
              ),
              title: MyText(text: 'Choose from Gallery'),
              onTap: () {
                Get.back();
                setState(() => _hasPhoto = true);
                Get.snackbar(
                  'Photo',
                  'Photo selected.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: kPrimary100,
                  colorText: kQuaternaryColor,
                );
              },
            ),
            if (_hasPhoto)
              ListTile(
                leading: const Icon(Icons.delete_outline, color: kRedColor),
                title: MyText(text: 'Remove Photo', color: kRedColor),
                onTap: () {
                  Get.back();
                  setState(() => _hasPhoto = false);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _pickPhoto,
        child: Stack(
          children: [
            _hasPhoto
                ? CommonImageView(
                    url: images[7],
                    height: 135,
                    width: 135,
                    radius: 300,
                  )
                : Container(
                    decoration: circle(kGrey3Color, kGrey3Color),
                    height: 135,
                    width: 135,
                  ),
            Positioned(
              child: CommonImageView(
                imagePath: Assets.imagesCamera,
                height: 56,
              ),
              bottom: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
