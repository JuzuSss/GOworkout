import 'package:flutter/material.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double? height, radius, bottom;
  final bool? isAvailable;

  const ImageCarousel({
    Key? key,
    required this.imageUrls,
    this.bottom,
    this.height,
    this.radius,
    this.isAvailable,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 1, keepPage: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages =
        widget.imageUrls
            .map(
              (url) => Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.radius ?? 4.0),
                child: Stack(
                  children: [
                    CommonImageView(
                      url: url,
                      height: widget.height ?? 200,
                      radius: widget.radius ?? 10,
                      width: Get.width,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: rounded2r(
                          widget.isAvailable == true
                              ? kQuaternaryColor.withOpacity(0.5)
                              : kBlack2Color.withOpacity(0.5),
                          ktransparent,
                          widget.radius ?? 7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList();

    return Stack(
      children: [
        SizedBox(
          height: widget.height ?? 200,
          width: Get.width,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (_, index) => pages[index % pages.length],
          ),
        ),
        Positioned(
          bottom: widget.bottom ?? 10,
          right: 0,
          left: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: kSecondaryColor,
                dotColor: kPrimaryColor.withOpacity(0.5),
                dotHeight: 6,
                dotWidth: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
