import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/booking/mybokings_body.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final bool hasnotification = false;
    return Scaffold(
      appBar: simpleAppBar(title: 'Notifications', centerTitle: T),
      body:
          hasnotification == true
              ? Center(
                child: NoItems(
                  title: 'No Notifications!',
                  subtitle: 'Notification inbox empty',
                  path: Assets.imagesNonotify,
                ),
              )
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
                        ListView.separated(
                          itemCount: images.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder:
                              (context, index) => Row(
                                spacing: 20,
                                children: [
                                  Expanded(
                                    child: Column(
                                      spacing: 10,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text:
                                              'Barbara Michelle confirmed your booking request',
                                        ),
                                        IconTextRow(
                                          text: '10:00',
                                          iconpath: Assets.imagesClock,
                                          iconsize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CommonImageView(
                                    url: images[index],
                                    height: 41,
                                    width: 41,
                                    radius: 100,
                                  ),
                                ],
                              ),
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(color: kPrimary100);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
