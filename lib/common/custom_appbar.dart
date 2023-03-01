// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/customtext.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? isBackButton;
  final double fontSize;
  final double iconSize;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.isBackButton = true,
    this.fontSize = 18,
    this.iconSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButton!
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: Theme.of(context).primaryColor,
                size: iconSize.sp,
              ),
            )
          : null,
      title: CustomText(
        text: title,
        fontSize: fontSize.sp,
        color: Theme.of(context).primaryColor,
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
