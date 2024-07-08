// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:news_app/constrains/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

IconButton myIconButton(
    {required VoidCallback onTap,
    required IconData btIcon,
    required Color iconColor,
    bool bgColor = true}) {
  return IconButton(
      onPressed: onTap,
      style: bgColor
          ? IconButton.styleFrom(backgroundColor: Colors.grey.shade200)
          : IconButton.styleFrom(),
      icon: Icon(
        btIcon,
        color: iconColor,
      ));
}

class MyBlurIconButton extends StatelessWidget {
  MyBlurIconButton({super.key, required this.icon, required this.onTap});
  IconData icon;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
        blur: 4,
        height: 50,
        width: 50,
        shape: BoxShape.circle,
        // borderWidth: 2,
        borderColor: Colors.black12,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        child: myIconButton(
            btIcon: icon,
            onTap: onTap,
            bgColor: false,
            iconColor: UiColors.white));
  }
}

SizedBox stackedBackground() {
  return SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
              color: UiColors.bgBlue,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10))),
        ),
      ],
    ),
  );
}

class ViewAllBar extends StatelessWidget {
  ViewAllBar(
      {super.key,
      required this.title,
      this.btName = 'View All',
      this.onTap,
      this.btFs = 14,
      this.titleFs = 18});
  String title;
  String btName;
  VoidCallback? onTap;
  double titleFs;
  double btFs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: titleFs, fontWeight: FontWeight.bold),
          ),
          // TextButton(
          //     onPressed: onTap,
          //     child: Text(
          //       btName,
          //       style: TextStyle(color: UiColors.btBlue, fontSize: btFs),
          //     ))
        ],
      ),
    );
  }
}

int? dotIndex12 = 1;
var carouselContoller = CarouselController();

class MyNewsCarousel extends StatefulWidget {
  MyNewsCarousel({
    super.key,
    this.counts = 6,
    required this.builder,
  });
  int counts;
  ExtendedIndexedWidgetBuilder builder;
  @override
  State<MyNewsCarousel> createState() => _MyNewsCarouselState();
}

class _MyNewsCarouselState extends State<MyNewsCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: widget.counts,
            carouselController: carouselContoller,
            disableGesture: false,
            itemBuilder: widget.builder,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  dotIndex12 = index;
                  setState(() {});
                },
                animateToClosest: true,
                enlargeFactor: 0.2,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.81,
                aspectRatio: 1.9,
                initialPage: 1)),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
            effect: const ExpandingDotsEffect(),
            onDotClicked: (index) {
              carouselContoller.jumpToPage(index);
              setState(() {});
            },
            activeIndex: dotIndex12!,
            count: widget.counts,
            curve: Curves.linear,
            duration: const Duration(milliseconds: 200)),
      ],
    );
  }

  // Widget builders(BuildContext context, int index, int realIndex) {
  //   return
  // }
}

IconButton buildBlurredIconButton(
    {required IconData icon, required VoidCallback onTap}) {
  return IconButton(
    onPressed: onTap,
    icon: Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0), // Adjust opacity as needed
              ),
            ),
            Icon(
              icon,
              color: Colors.white, // Adjust icon color as needed
              size: 30.0, // Adjust icon size as needed
            ),
          ],
        ),
      ],
    ),
  );
}
