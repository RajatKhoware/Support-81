// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/features/Product%20Details/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/common/button.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/colors.dart';

import '../../../common/custom_appbar.dart';
import '../../../common/my_future.dart';
import '../../../common/snakebar.dart';
import '../../../constant/app_theme.dart';
import '../../Product Details/services/product_details_services.dart';

class RateAndReviewScreen extends StatefulWidget {
  static const String routeName = '/rating';
  final double productId;
  const RateAndReviewScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<RateAndReviewScreen> createState() => _RateAndReviewScreenState();
}

class _RateAndReviewScreenState extends State<RateAndReviewScreen> {
  ProductDetailsServices _detailsServices = ProductDetailsServices();
  //Star icon
  final starIcon = Icon(
    Icons.star,
    size: 20.sp,
    color: Color.fromARGB(255, 255, 211, 34),
  );
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) {
        return Scaffold(
            // AppBar
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "Rating & Review",
                fontSize: 18.sp,
                iconSize: 25.sp,
              ),
            ),
            body: MyFutureBuilder(
              future: _detailsServices.getProductDetails(
                productId: widget.productId,
                context: context,
              ),
              builder: (context, data) {
                final product = data.data!;
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 335.w,
                        height: 105.h,
                        child: Row(
                          children: [
                            // Product Image
                            Container(
                              width: 100.w,
                              height: 105.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(product.image![0]),
                                  //fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 18.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.h),
                                // Product Name
                                SizedBox(
                                  width: 210.w,
                                  child: CustomTextPoppines(
                                    text: product.productName.toString(),
                                    maxLines: 1,
                                    fontSize: 13.sp,
                                    color: AppTheme.greyColor909090,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                // Rating
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 24.sp,
                                      color: Color.fromARGB(255, 255, 211, 34),
                                    ),
                                    SizedBox(width: 10.w),
                                    CustomTextInter(
                                      text: product.avgRating.toString(),
                                      fontSize: 24.sp,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                // No. of reviews
                                CustomTextInter(
                                  text: product.reviews!.length.toString(),
                                  fontSize: 18.sp,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.9),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Reviews
                      if (product.reviews!.length > 0)
                        Expanded(
                          child: ListView.builder(
                            itemCount: product.reviews!.length,
                            itemBuilder: (context, index) {
                              final rating = product.reviews![index];
                              return Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 194.h,
                                  child: Stack(
                                    children: [
                                      //Review card
                                      Positioned(
                                        top: 20.h,
                                        child: Container(
                                          width: 360.w,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(context)
                                                   .shadowColor
                                                    .withOpacity(0.2),
                                                offset: const Offset(0, 8),
                                                blurRadius: 20.r,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 10.w,
                                              right: 10.w,
                                              top: 40.h,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // User name
                                                    CustomTextPoppines(
                                                      text: rating.userName
                                                          .toString(),
                                                      fontSize: 14.sp,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    // Date of review
                                                    CustomTextPoppines(
                                                      text: "20/03/2020",
                                                      fontSize: 12.sp,
                                                      color: AppTheme
                                                          .greyColor909090,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 2.h),
                                                // 5 stars
                                                Row(
                                                  children: [
                                                    starIcon,
                                                    starIcon,
                                                    starIcon,
                                                    starIcon,
                                                    starIcon,
                                                  ],
                                                ),
                                                // Reviews
                                                SizedBox(height: 12.h),
                                                CustomTextPoppines(
                                                  text: rating.description
                                                      .toString(),
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppTheme.greyColor909090,
                                                  height: 1.6.h,
                                                ),
                                                SizedBox(height: 12.h),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      //Profile pic in center
                                      if (rating.userImage == null)
                                        Positioned(
                                          left: 155.w,
                                          child: CircleAvatar(
                                            radius: 25.r,
                                            backgroundColor: Colors.yellow,
                                            child: Image.asset(
                                              "assets/images/Man.png",
                                            ),
                                          ),
                                        )
                                      else
                                        // ignore: dead_code
                                        Positioned(
                                          left: 155.w,
                                          child: CircleAvatar(
                                            radius: 25.r,
                                            backgroundColor: Colors.yellow,
                                            child: Image.network(
                                              rating.userImage.toString(),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (product.reviews!.length == 0)
                        Column(
                          children: [
                            SizedBox(height: 200.h),
                            CustomTextPoppines(text: "Write the first review "),
                            SizedBox(height: 250.h),
                          ],
                        ),
                      CustomButton(
                        width: double.infinity,
                        height: 55.h,
                        color: GloabalVariables.buttonRed,
                        text: "Write a review",
                        fontSize: 17.sp,
                        onTap: () {
                          showSnakeBar(context,
                              "No clue so this feature is not spported Yet!");
                        },
                      )
                    ],
                  ),
                );
              },
            ));
      },
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    //Star icon
    final starIcon = Icon(
      Icons.star,
      size: 20.sp,
      color: Color.fromARGB(255, 255, 211, 34),
    );

    return SizedBox(
      width: 343.w,
      height: 194.h,
      child: Stack(
        children: [
          //Review card
          Positioned(
            top: 20.h,
            child: Container(
              width: 343.w,
              height: 173.h,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.2),
                    offset: const Offset(0, 8),
                    blurRadius: 20.r,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // User name
                        CustomTextPoppines(
                          text: "Bruno Fernandes",
                          fontSize: 14.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                        // Date of review
                        CustomTextPoppines(
                          text: "20/03/2020",
                          fontSize: 12.sp,
                          color: AppTheme.greyColor909090,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    // 5 stars
                    Row(
                      children: [
                        starIcon,
                        starIcon,
                        starIcon,
                        starIcon,
                        starIcon,
                      ],
                    ),
                    // Reviews
                    SizedBox(height: 12.h),
                    CustomTextPoppines(
                      text:
                          '''Nice Product with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app.''',
                      fontSize: 14.sp,
                      color: AppTheme.greyColor909090,
                      height: 1.6.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Profile pic in center
          Positioned(
            left: 155.w,
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.yellow,
              child: Image.asset("assets/images/Man.png"),
            ),
          ),
        ],
      ),
    );
  }
}
