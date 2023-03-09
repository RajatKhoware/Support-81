// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/constant/app_theme.dart';

import '../../../common/customtext.dart';

class ProfileCard extends StatelessWidget {
  final String cardHeadline;
  final String cardSubHeadline;
  final VoidCallback onTap;
  const ProfileCard({
    Key? key,
    required this.cardHeadline,
    required this.cardSubHeadline,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height > 820 ? 90.h : 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              offset: const Offset(0, 8),
              blurRadius: 40.r,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppines(
                    text: cardHeadline,
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  CustomTextPoppines(
                    text: cardSubHeadline,
                    fontSize: 12.sp,
                    color: AppTheme.greyColor909090,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: Icon(
                CupertinoIcons.forward,
                color: Theme.of(context).primaryColor,
                size: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
