// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';

class Payment_Card_Widget extends StatelessWidget {
  final bool isGreenGradient;
  const Payment_Card_Widget({
    Key? key,
    required this.isGreenGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: isGreenGradient
            ? LinearGradient(
                colors: [
                  Color(0xFF21E134),
                  Color(0xFF000000).withOpacity(0.95),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : LinearGradient(
                colors: [
                  Color(0xFFB125F3),
                  Color(0xFF13557A).withOpacity(0.5),
                  Color(0xFF000000).withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cricles Desgins
            SizedBox(
              width: 50.w,
              height: 30.h,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppTheme.blackColor303030.withOpacity(0.4),
                  ),
                  Positioned(
                    right: 5.w,
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor:
                          AppTheme.blackColor303030.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            20.vs,
            // Card Number
            CustomTextPoppines(
              text: "6316    9224    8124    9875",
              fontSize:
                  MediaQuery.of(context).size.height > 820 ? 20.sp : 24.sp,
              fontWeight: FontWeight.bold,
            ),
            MediaQuery.of(context).size.height > 820 ? 20.vs : 25.vs,
            // Card Holder name
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPoppines(
                      text: "CARD HOLDER",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.whiteColorFFFFFF.withOpacity(0.5),
                    ),
                    3.vs,
                    CustomTextPoppines(
                      text: "Lailyafa Febrina",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.whiteColorFFFFFF,
                    ),
                  ],
                ),
                40.hs,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextPoppines(
                      text: "CARD SAVE",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.whiteColorFFFFFF.withOpacity(0.5),
                    ),
                    3.vs,
                    CustomTextPoppines(
                      text: "19/2042",
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.whiteColorFFFFFF,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
