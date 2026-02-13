import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/auth/profile_setup.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_drop_down.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Edit Profile', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                PhotoStack(isattach: true),
                MyText(
                  paddingTop: 10,
                  text: 'Upload Your Photo',
                  textAlign: TextAlign.center,
                  size: 18,
                  paddingBottom: 20,
                  weight: wmedium,
                ),
                CustomDropDown(
                  heading: 'Player Level',
                  hint: 'Select',
                  items: ['National'],
                  onChanged: (v) {},
                ),
                MyTextField(label: 'Email', labelColor: kGrey5Color),
                MyTextField(label: 'User Name'),
                MyTextField(
                  label: 'Age',
                  suffixIcon: CommonImageView(
                    imagePath: Assets.imagesCalender,
                    height: 20,
                  ),
                ),
                MyButton(onTap: () {}, buttonText: 'Save Changes', mTop: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
