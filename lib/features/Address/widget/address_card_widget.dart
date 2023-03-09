import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/extensions.dart';
import '../../../constant/app_theme.dart';

class Address_Cards_Widget extends StatelessWidget {
  const Address_Cards_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(width: 1.w, color: AppTheme.whiteColorFFFFFF),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTextPoppines(
            text: "Priscekilla",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          20.vs,
          CustomTextPoppines(
            text:
                "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
            fontSize: 12.sp,
          ),
          20.vs,
          CustomTextPoppines(
            text: "+99 1234567890",
            fontSize: 12.sp,
          ),
          20.vs,
          Row(
            children: [
              Container(
                width: 77.w,
                height: 57.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppTheme.darkRedColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5.r,
                      blurRadius: 10.r,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: CustomTextPoppines(
                    text: "Edit",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              40.hs,
              InkWell(
                child: Icon(
                  Icons.delete,
                  color: AppTheme.greyColor909090,
                  size: 30.sp,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
