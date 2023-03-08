import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/button.dart';
import '../../../common/customtext.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 130.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          Center(
            child: CustomTextPoppines(
              text: "SUCCESS!",
              fontSize: 32.sp,
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 60.h),
          SizedBox(
            width: 240.w,
            height: 220.h,
            child: Theme.of(context).brightness == Brightness.light
                ? Image.asset("assets/images/Motorcycle.png")
                : Stack(
                    children: [
                      Positioned(
                        left: 150.w,
                        top: 5.h,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: GloabalVariables.buttonRed,
                        ),
                      ),
                      Positioned(
                        left: 190.w,
                        top: 8.h,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: GloabalVariables.buttonRed,
                        ),
                      ),
                      Positioned(
                        left: 215.w,
                        top: 70.h,
                        child: CircleAvatar(
                          radius: 8.r,
                          backgroundColor: GloabalVariables.buttonRed,
                        ),
                      ),
                      Positioned(
                        left: 35.w,
                        top: 30.h,
                        child: CircleAvatar(
                          radius: 80.r,
                          backgroundColor: GloabalVariables.buttonRed,
                        ),
                      ),
                      Positioned(
                        left: 26.w,
                        top: 48.h,
                        child: SizedBox(
                          width: 150.w,
                          height: 150.h,
                          child: Image.asset(
                            "assets/images/rock_sign.png",
                            scale: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 15.h),
          Center(
            child: CustomTextPoppines(
              text: '''Your order will be delivered soon.
Thank you for choosing our app!''',
              fontSize: 17.sp,
              color: AppTheme.greyColor909090,
            ),
          ),
          SizedBox(height: 110.h),
          CustomButton(
            width: double.infinity,
            height: 50.h,
            color: Theme.of(context).canvasColor,
            text: "Review & Rate",
            fontSize: 15.sp,
            fontColor: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            onTap: () {
              Navigator.pushNamed(context, "/rate-review");
            },
          ),
          SizedBox(height: 10.h),
          CustomButton(
            width: double.infinity,
            height: 50.h,
            color: Theme.of(context).canvasColor,
            text: "Back to home",
            fontSize: 15.sp,
            fontColor: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
          ),
        ],
      ),
    ));
  }
}
