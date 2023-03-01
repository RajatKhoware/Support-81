import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCarouselImgs extends StatefulWidget {
  const OfferCarouselImgs({super.key});

  @override
  State<OfferCarouselImgs> createState() => _OfferCarouselImgsState();
}

class _OfferCarouselImgsState extends State<OfferCarouselImgs> {
  // Banner Imgs
  final offerBannerImg = [
    "assets/products/banner.png",
    "assets/products/banner.png",
    "assets/products/banner.png",
    "assets/products/banner.png",
  ];
  // Active index of dots
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 180.h,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            //  autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            // reverse: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemCount: offerBannerImg.length,
          itemBuilder: (context, index, realIndex) {
            final bannerImg = offerBannerImg[index];

            return buildImg(bannerImg, index);
          },
        ),
        SizedBox(height: 15.h),
        //Dots indicator
        buildIndicator(),
      ],
    );
  }

  //Carousle Container
  Widget buildImg(String bannerImg, int index) => Container(
        width: double.infinity,
        height: 170.h,
        // margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.white,
        child: Image.asset(
          bannerImg,
          fit: BoxFit.cover,
        ),
      );

  //Dot indicator
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: offerBannerImg.length,
        effect: JumpingDotEffect(
          dotWidth: 4.w,
          dotHeight: 4.h,
          activeDotColor: GloabalVariables.buttonRed,
          spacing: 5.w,
        ),
      );
}
