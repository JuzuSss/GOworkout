import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/view/screens/coach/all_transactions.dart';
import 'package:go_workout/view/screens/coach/withdrawal.dart';
import 'package:go_workout/view/widgets/line_graph.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/tabs_widget.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class TransactionCoach extends StatelessWidget {
  const TransactionCoach({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt _currentIndex = 0.obs;
    List<String> items = ['All', 'Incoming', 'Finished'];
    List<Widget> tabbarview = [AllTransactions(), Container(), Container()];
    return Scaffold(
      appBar: simpleAppBar(title: 'Transaction', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              physics: BouncingScrollPhysics(),

              children: [
                TwoTextedColumn(
                  text1: 'Total Balance',
                  text2: '\$24,000',
                  size1: 13,
                  size2: 48,
                  weight2: wbold,
                  color2: kQuaternaryColor,
                  color1: kGrey5Color,
                  alignment: ColumnAlignment.center,
                  weight1: wregular,
                  space: 0,
                ),
                LineGraph(),
                Obx(
                  () => TabsWidget(
                    currentindex: _currentIndex.value,
                    items: items,
                    ontap: (index) {
                      _currentIndex.value = index;
                    },
                  ),
                ),
                Obx(
                  () => IndexedStack(
                    children: tabbarview,
                    index: _currentIndex.value,
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
          Get.to(() => Withdrawal());
        },
        buttonText: 'Withdrawal',
        mhoriz: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
