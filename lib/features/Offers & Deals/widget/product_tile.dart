// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/features/Product%20Details/screens/product_details.dart';

class ProductsTile extends StatelessWidget {
  final bool isOfferProducts;
  final double productId;
  final String productName;
  final String productPrice;
  final String productImg;
  const ProductsTile({
    Key? key,
    this.isOfferProducts = false,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImg,
  }) : super(key: key);

  getProductDetails(BuildContext context, double product) {
    Navigator.pushNamed(
      context,
      ProductDetailsPage.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            getProductDetails(
              context,
              productId,
            );
          },
          child: SizedBox(
            width: 170.w,
            height: 220.h,
            child: Stack(
              children: [
                Positioned(
                  top: 25.h,
                  bottom: 0.h,
                  child: Container(
                    width: 170.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          productImg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                isOfferProducts
                    ? Positioned(
                        child: SizedBox(
                          width: 55.w,
                          height: 55.h,
                          child: Image.asset(
                            "assets/images/offer_tag.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  bottom: 15.h,
                  right: 10.w,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, "/my-cart");
                        print(MediaQuery.of(context).size.width);
                        print(MediaQuery.of(context).size.height);
                      },
                      child: Icon(
                        CupertinoIcons.bag_fill,
                        color: AppTheme.blackColor171717.withOpacity(0.7),
                        size: 24.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: SizedBox(
            // height: 35.h,
            child: CustomTextPoppines(
              text: productName,
              maxLines: 2,
              fontSize: screenHeight > 820
                  ? 11.sp
                  : screenHeight > 790
                      ? 12.sp
                      : 13.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: CustomTextPoppines(
            text: "\$$productPrice",
            fontSize: screenHeight > 820
                ? 14.sp
                : screenHeight > 790
                    ? 15.sp
                    : 16.sp,
            color: Theme.of(context).primaryColorLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
