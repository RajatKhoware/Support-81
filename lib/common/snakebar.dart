import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnakeBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      duration: Duration(seconds: 2),
      content: Container(
          padding: EdgeInsets.all(10.h.w),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: CustomTextPoppines(
            text: text,
            color: AppTheme.whiteColorFFFFFF,
            fontWeight: FontWeight.w600,
            maxLines: 10,
          )),
    ),
  );
}
