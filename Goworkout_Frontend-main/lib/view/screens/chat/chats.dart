import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_sizes.dart';
import 'package:go_workout/generated/assets.dart' show Assets;
import 'package:go_workout/view/screens/booking/mybokings_body.dart';
import 'package:go_workout/view/screens/home/home.dart';
import 'package:go_workout/view/widgets/chat_heads.dart';
import 'package:go_workout/view/widgets/coach_tile.dart';
import 'package:go_workout/view/widgets/moving_icon.dart';
import 'package:go_workout/view/widgets/two_text_column.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    bool haschats = true;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(isfexiblespace: false),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child:
                  haschats == false
                      ? Center(
                        child: NoItems(
                          mtop: 140,
                          mbottom: 0,
                          title: 'No Conversation!',
                          subtitle: 'There are no chats in your feed',
                          path: Assets.imagesNochat,
                        ),
                      )
                      : Column(
                        children: [
                          ListView.builder(
                            itemCount: images.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder:
                                (context, index) => ChatHeads(
                                  url: images[index],
                                  duration: 300 * index + 200,
                                  isread: index == 0 ? true : false,
                                ),
                          ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
