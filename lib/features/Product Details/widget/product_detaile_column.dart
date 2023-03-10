// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Rating%20&%20Review/screens/rate_review_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/constant/app_theme.dart';

import '../../../common/customtext.dart';
import '../../../common/quanity_inn_dec_button.dart';

class ProductDetaileColumn extends StatefulWidget {
  final String? productPrice;
  final double productId;
  final double avgRating;

  const ProductDetaileColumn({
    Key? key,
    this.productPrice = "\$ 25",
    required this.productId,
    required this.avgRating,
  }) : super(key: key);

  @override
  State<ProductDetaileColumn> createState() => _ProductDetaileColumnState();
}

class _ProductDetaileColumnState extends State<ProductDetaileColumn> {
  int initialQunaity = 1;
  var currentIndex = 0;
  final List<String> productSize = ["XS", "S", "M", "L", "XL"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Product Name
        CustomTextPoppines(
          text:
              "Hells Angels 81 Anniversary Black Jacket Support81 Big Red Machine",
          fontSize: 19.sp,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.normal,
        ),
        SizedBox(height: 8.h),
        //Rate and Reviews
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RateAndReviewScreen.routeName,
              arguments: widget.productId,
            );
          },
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 209, 59),
              ),
              SizedBox(width: 5.w),
              CustomTextPoppines(
                text: "4.5",
                //text: avgRating.toString(),
                fontSize: 18.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 16.w),
              CustomTextPoppines(
                text: "(50 reviews)",
                fontSize: 14.sp,
                color: AppTheme.greyColor909090,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
        10.vs,
        // Select size
        SizedBox(
          height: 38.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productSize.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Container(
                    width: 42.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: currentIndex == index
                          ? AppTheme.darkRedColor
                          : AppTheme.greyColor2B2B2B,
                    ),
                    child: Center(
                      child: CustomTextPoppines(
                        text: productSize[index],
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        15.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Price of Product
            CustomTextPoppines(
              text: "\$${widget.productPrice}",
              fontSize: 32.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
            // Qunatity Inc Dec Button
            SizedBox(
              width: 113.w,
              height: 30.h,
              child: Row(children: [
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Theme.of(context).dividerColor.withOpacity(0.6),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        initialQunaity = ++initialQunaity;
                      });
                    },
                    child: Icon(
                      CupertinoIcons.plus,
                      size: 18.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                CustomTextInter(
                  text: initialQunaity.toString(),
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 14.w),
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Theme.of(context).dividerColor.withOpacity(0.6),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (initialQunaity > 1) {
                          initialQunaity = --initialQunaity;
                        }
                      });
                    },
                    child: Icon(
                      CupertinoIcons.minus,
                      size: 18.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
