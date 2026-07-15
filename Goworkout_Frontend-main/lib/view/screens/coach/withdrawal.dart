import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/screens/profile/trans_details.dart';
import 'package:go_workout/view/screens/profile/transanctions.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_field.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Withdrawal extends StatelessWidget {
  const Withdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Withdrawal', centerTitle: true),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  decoration: roundedr(kPrimary100, 20),
                  child: Column(
                    children: [
                      MyText(
                        text: 'Enter Amount',
                        paddingTop: 30,
                        paddingBottom: 20,
                      ),
                      MyTextField(
                        prefixIcon: MyText(text: '\$', size: 33, weight: wbold),
                        hintsize: 33,
                        hintweight: wbold,
                        fbordercolor: ktransparent,
                        hint: '0000',
                        isright: true,
                        filledColor: ktransparent,
                        bordercolor: ktransparent,
                        marginBottom: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: MyButton(
        mBottom: 30,
        onTap: () {
          Get.to(() => TransDetails());
        },
        buttonText: 'Withdrawal',
        mhoriz: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
