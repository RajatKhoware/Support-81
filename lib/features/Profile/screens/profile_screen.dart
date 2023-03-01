// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/customtext.dart';
import '../widget/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(
                title: "Profile",
                fontSize: 18.sp,
                iconSize: 25.sp,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Column(
                children: [
                  //Profile Detailes
                  SizedBox(
                    width: 335.w,
                    height: 70.h,
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/Man.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextInter(
                                text: "John Doe",
                                fontSize: 20.sp,
                                color: Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 5.h),
                              CustomTextInter(
                                text: "bruno203@gmail.com",
                                fontSize: 14.sp,
                                color: AppTheme.greyColor909090,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const ProfileCard(),
                  const ProfileCard(),
                  const ProfileCard(),
                  const ProfileCard(),
                  const ProfileCard(),
                  SizedBox(height: 30.h),
                  CustomButton(
                    width: 161.w,
                    height: 45.h,
                    color: GloabalVariables.buttonRed,
                    text: "Log Out",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
