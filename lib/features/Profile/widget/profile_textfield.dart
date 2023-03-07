// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';

class ProfileTextField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  const ProfileTextField({
    Key? key,
    required this.fieldName,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: CustomTextPoppines(
            text: fieldName,
            fontWeight: FontWeight.w600,
          ),
        ),
        10.vs,
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(color: AppTheme.whiteColorFFFFFF)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppTheme.whiteColorFFFFFF)),
            hintText: hintText,
          ),
        ),
        15.vs,
      ],
    );
  }
}
