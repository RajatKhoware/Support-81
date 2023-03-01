import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/features/Product%20Details/screens/product_details.dart';
import '../../../constant/app_theme.dart';

class Bookmark_product_widget extends StatefulWidget {
  final double productId;
  final String productImg;
  final String productName;
  final String productPrice;
  const Bookmark_product_widget({
    Key? key,
    required this.productId,
    required this.productImg,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  State<Bookmark_product_widget> createState() =>
      _Bookmark_product_widgetState();
}

class _Bookmark_product_widgetState extends State<Bookmark_product_widget> {
  void navigateToProductDetails() {
    Navigator.pushNamed(
      context,
      ProductDetailsPage.routeName,
      arguments: widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: navigateToProductDetails,
          child: SizedBox(
            width: 158.w,
            height: 200.h,
            child: Stack(
              children: [
                Positioned(
                  top: 7.h,
                  bottom: 0.h,
                  child: Container(
                    width: 158.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.productImg,
                        ),
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 12.w,
                  child: SizedBox(
                    width: 20.w,
                    height: 18.h,
                    child: Image.asset(
                      "assets/images/heart.png",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
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
                        Navigator.pushNamed(context, "/my-cart");
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
          child: CustomTextPoppines(
            text: widget.productName,
            fontSize: 13.sp,
            maxLines: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: CustomTextPoppines(
            text: "\$${widget.productPrice}",
            fontSize: 16.sp,
            color: Theme.of(context).primaryColorLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
