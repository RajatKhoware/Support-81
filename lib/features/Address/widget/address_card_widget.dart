// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/common/customtext.dart';
import 'package:support__81/extensions.dart';

import '../../../constant/app_theme.dart';

class Address_Cards_Widget extends StatelessWidget {
  final String fullName;
  final String fullAddress;
  final String mobileNumber;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const Address_Cards_Widget({
    Key? key,
    required this.fullName,
    required this.fullAddress,
    required this.mobileNumber,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(width: 1.w, color: AppTheme.whiteColorFFFFFF),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextPoppines(
          text: fullName,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        20.vs,
        CustomTextPoppines(
          text: fullAddress,
          fontSize: 12.sp,
        ),
        20.vs,
        CustomTextPoppines(
          text: mobileNumber,
          fontSize: 12.sp,
        ),
        20.vs,
        Row(
          children: [
            InkWell(
              onTap: onEdit,
              child: Container(
                width: 77.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppTheme.darkRedColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
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
            ),
            40.hs,
            InkWell(
              onTap: onDelete,
              child: Icon(
                Icons.delete,
                color: AppTheme.greyColor909090,
                size: 30.sp,
              ),
            )
          ],
        )
      ]),
    );
  }
}
