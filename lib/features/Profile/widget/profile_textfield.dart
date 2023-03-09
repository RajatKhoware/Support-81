// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';

class ProfileTextField extends StatelessWidget {
  final String? fieldName;
  final String hintText;
  final bool? isFieldName;
  final int? maxLines;
  const ProfileTextField({
    Key? key,
    this.fieldName,
    required this.hintText,
    this.isFieldName = true,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFieldName!
            ? Padding(
                padding: EdgeInsets.only(left: 5.w, bottom: 10.h),
                child: CustomTextPoppines(
                  text: fieldName!,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            : SizedBox(),
        TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w, vertical: (maxLines! >= 3) ? 20.h : 0.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular((maxLines! >= 3) ? 15.r : 30.r),
                  borderSide: BorderSide(color: AppTheme.whiteColorFFFFFF)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: AppTheme.whiteColorFFFFFF)),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 16.sp)),
          maxLines: maxLines,
        ),
        15.vs,
      ],
    );
  }
}
