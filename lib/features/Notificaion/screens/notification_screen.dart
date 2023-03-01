// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/customtext.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "Notification",
                fontSize: 18.sp,
                iconSize: 25.sp,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(children: const [
                NotificationCard(),
                NotificationCard(isHot: true),
                NotificationCard(),
                NotificationCard(isHot: true),
              ]),
            ),
          );
        });
  }
}

class NotificationCard extends StatelessWidget {
  final bool isHot;
  const NotificationCard({
    Key? key,
    this.isHot = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 110.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/products/tshirt_pack.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppines(
                    text:
                        "Your order #123456789 has been \nshipped successfully",
                    fontSize: 14.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextPoppines(
                        text:
                            "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. ",
                        fontSize: 14.sp,
                        color: AppTheme.greyColor909090,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(width: 15.w),
                      CustomText(
                        text: isHot ? "Hot" : "New",
                        fontSize: 16.sp,
                        color: isHot ? Colors.red : Colors.green,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Divider(
            thickness: 2.0.h,
            color: Theme.of(context).dividerColor,
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
