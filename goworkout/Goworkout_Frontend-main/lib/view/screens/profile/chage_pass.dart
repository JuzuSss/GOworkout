import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_fonts.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class ChagePass extends StatelessWidget {
  const ChagePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Change Password', centerTitle: T),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Enter your ',
                          style: TextStyle(
                            color: kGrey5Color,
                            fontSize: 14,
                            fontFamily: SFPRO,
                          ),
                        ),
                        TextSpan(
                          text: '  new password',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 14,
                            fontFamily: SFPRO,
                          ),
                        ),
                        TextSpan(
                          text: ' below  and your password will be updated',
                          style: TextStyle(
                            color: kGrey5Color,
                            fontSize: 14,
                            fontFamily: SFPRO,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                MyTextField(
                  suffixIcon: CommonImageView(
                    imagePath: Assets.imagesEye,
                    height: 16,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  hint: 'Current Password',
                ),
                MyTextField(
                  suffixIcon: CommonImageView(
                    imagePath: Assets.imagesEye,
                    height: 16,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  hint: 'New Password',
                ),
                MyTextField(
                  suffixIcon: CommonImageView(
                    imagePath: Assets.imagesEye,
                    height: 16,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                  hint: 'Confirm Password',
                ),
                MyButton(onTap: () {}, buttonText: 'Update Password'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
