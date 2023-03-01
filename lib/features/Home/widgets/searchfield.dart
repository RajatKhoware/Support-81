import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SerachField extends StatelessWidget {
  const SerachField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppTheme.whiteColorF5F5F5,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: SizedBox(
          height: 40.h,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search...",
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 15.sp,
                  fontFamily: "Montserrat"),
              suffixIcon: Icon(
                CupertinoIcons.search,
                color: AppTheme.greyColor909090,
                size: 25.sp,
              ),
            ),
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
