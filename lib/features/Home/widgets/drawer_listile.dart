// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/customtext.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: SizedBox(
          child: Row(children: [
            Icon(
              icon,
              size: 25.sp,
              color: Theme.of(context).cardColor,
            ),
            SizedBox(width: 10.w),
            CustomText(
              text: text,
              color: Theme.of(context).cardColor,
              fontSize: 18.sp,
            ),
          ]),
        ),
      ),
    );
  }
}
