import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/app_text.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';

import '../../common/custom_appbar.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/about-us';
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "About Us",
          fontSize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h.w),
        child: SingleChildScrollView(
          child: CustomTextPoppines(
            text: AppText.aboutUs,
            maxLines: 10000,
            color: AppTheme.greyColor909090,
          ),
        ),
      ),
    );
  }
}
