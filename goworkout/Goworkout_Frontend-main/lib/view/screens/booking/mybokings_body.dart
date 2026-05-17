import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/animate_widget.dart';
import 'package:go_workout/view/widgets/booking_tile.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class MybokingsBody extends StatelessWidget {
  final bool? isUpcomig;
  const MybokingsBody({super.key, this.isUpcomig = true, this.iscoach});
  final bool? iscoach;

  @override
  Widget build(BuildContext context) {
    bool hasevent = true;
    return Scaffold(
      body:
          hasevent == false
              ? NoItems()
              : Column(
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
                        ListView.builder(
                          itemCount: images.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder:
                              (context, index) => MoveAnimaate(
                                duration: (300 * index) + 200,
                                child: BookingTile(
                                  iscoach: iscoach,
                                  path: images[index],
                                  status:
                                      isUpcomig == false
                                          ? 'prev'
                                          : index == 2
                                          ? 'cancelled'
                                          : null,
                                ),
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

class NoItems extends StatelessWidget {
  final String? title, subtitle, path;
  final bool? hasbutton;
  final double? mtop, mbottom;
  const NoItems({
    super.key,
    this.title,
    this.subtitle,
    this.path,
    this.hasbutton = false,
    this.mtop,
    this.mbottom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: mtop ?? 0),
        Center(child: MovingIcon(path: path ?? Assets.imagesSad, height: 114)),
        TwoTextedColumn(
          text1: title ?? 'No Event!',
          text2: subtitle ?? 'You have no upcoming Bookings',
          size1: 20,
          size2: 16,
          color1: kGrey5Color,
          weight1: wregular,
          color2: kGrey5Color,
          textAlign: TextAlign.center,
          alignment: ColumnAlignment.center,
        ),
        if (hasbutton == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                mTop: 20,
                onTap: () {},
                buttonText: 'Discover More',
                height: 32,
                fontSize: 14,
                backgroundColor: ktransparent,
                outlineColor: kQuaternaryColor,
              ),
            ],
          ),
        SizedBox(height: mbottom ?? 100),
      ],
    );
  }
}
