import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Profile/widget/profile_textfield.dart';

import '../../../common/custom_appbar.dart';

class ContactUs extends StatelessWidget {
  static const String routeName = '/contact-us';
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Contact Us",
          fontSize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(children: [
          20.vs,
          ProfileTextField(
            isFieldName: false,
            hintText: "Your Full Name",
          ),
          ProfileTextField(
            isFieldName: false,
            hintText: "Your Message",
            maxLines: 10,
          ),
          10.vs,
          CustomButton(
            width: 130.w,
            height: 40.h,
            color: AppTheme.darkRedColor,
            text: "Submit",
          ),
          20.vs,
          Row(
            children: [
              Container(
                width: 155.w,
                height: 1.0.h,
                color: AppTheme.greyColor909090,
              ),
              SizedBox(width: 10.h),
              CustomTextPoppines(
                  text: "or",
                  fontSize: 12.sp,
                  color: AppTheme.greyColor909090,
                  fontWeight: FontWeight.normal),
              SizedBox(width: 10.h),
              Container(
                width: 155.w,
                height: 1.0.h,
                color: AppTheme.greyColor909090,
              ),
            ],
          ),
          20.vs,
          CustomTextPoppines(
            text: "Reach us at",
            fontSize: 13.sp,
            color: AppTheme.greyColor909090,
            fontWeight: FontWeight.w600,
          ),
          10.vs,
          CustomTextPoppines(
            text: "Company@gmail.com\n   022-XXXXXX XXXXXX",
            fontSize: 13.sp,
            color: AppTheme.greyColor808080,
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.instagram,
              size: 30.sp,
            ),
            10.hs,
            Icon(
              Icons.facebook,
              size: 30.sp,
            ),
            10.hs,
            Icon(
              CupertinoIcons.globe,
              size: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
