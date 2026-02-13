import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/main.dart';
import 'package:go_workout/view/screens/auth/coach_setup/add_session.dart';
import 'package:go_workout/view/screens/auth/coach_setup/my_sessions.dart';
import 'package:go_workout/view/screens/booking/confirmed_details.dart';
import 'package:go_workout/view/screens/coach/home_c/all_requests.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/widgets/animated_column.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_rich_text.dart';
import 'package:go_workout/view/widgets/icon_text_row.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/title_row.dart';
import 'package:go_workout/view/widgets/widget_text_row.dart';

class DashboardCoach extends StatelessWidget {
  const DashboardCoach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 20,
              ),
              child: AnimatedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TitleRow(
                      title: 'New Requests',
                      padends: 0,
                      onseeallTap: () {
                        Get.to(() => AllRequests());
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(images.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(
                            right: 10,
                            left: index == 0 ? 10 : 0,
                          ),

                          width: 328,

                          child: RequestTile(path: images[index]),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: TitleRow(
                      title: 'My Sessions',
                      padends: 0,
                      onseeallTap:
                          () => Get.to(() => MySessions(isauth: false)),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SessionsTile(isedit: F),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Bounce(
        onTap: () => Get.to(() => AddSession(isauth: false)),
        child: Container(
          decoration: circle(kQuaternaryColor, kQuaternaryColor),
          height: 78,
          width: 78,
          child: Icon(Icons.add, color: kTertiaryColor),
        ),
      ),
    );
  }
}

class RequestTile extends StatelessWidget {
  final String? path;
  const RequestTile({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Get.to(() => ConfirmedDetails(status: 'reschedule', iscoach: true));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: roundedr(kPrimary100, 15),
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                CommonImageView(
                  url: path ?? dummyImage,
                  height: 60,
                  width: 60,
                  radius: 200,
                ),
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: '14 June', size: 16, weight: wsemibold),
                      IconTextRow(
                        text: 'Bronx, New York(NY)',
                        iconpath: Assets.imagesMaker,
                        iconcolor: kGrey5Color,
                        textsize: 12,
                      ),
                      WidgetTextRow(
                        textSize: 12,
                        flipX: true,
                        text: '22 October, 10:00',
                        child: Icon(
                          Icons.circle,
                          color: kSecondaryColor,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonImageView(imagePath: Assets.imagesClose2, height: 18),
                    PriceText(
                      info: '\$21',
                      title: '/hr',
                      color2: kQuaternaryColor,
                      fontWeight2: wbold,
                      fontWeight: wlight,
                      size1: 20,
                      color: kQuaternaryColor,
                    ),
                  ],
                ),
              ],
            ),
            MyButton(
              onTap: () {},
              buttonText: 'Accept',
              height: 29,
              fontSize: 12,
              mTop: 10,
              mBottom: 5,
              mhoriz: 30,
            ),
          ],
        ),
      ),
    );
  }
}
