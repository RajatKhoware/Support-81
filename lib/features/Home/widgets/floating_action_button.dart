// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/features/Bookmark/screens/bookmark_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloadtingActionButton extends StatelessWidget {
  const FloadtingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 48.h,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        onPressed: () {
          // Navigator.pushNamed(context, BookMarkScreen.routeName);
        },
        child: Icon(
          FontAwesomeIcons.filter,
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          size: 32.sp,
        ),
      ),
    );
  }
}
