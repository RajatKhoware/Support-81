import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandedDescriptionState();
}

class _ExpandedDescriptionState extends State<ExpandableTextWidget> {
  // Text half according to lenght
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  // Default height of text
  double textHeight = 230.h;

  @override
  void initState() {
    super.initState();
    // If text is more than 200 it will slip in two sections
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? CustomTextPoppines(
              text: widget.text,
              color: AppTheme.greyColor909090,
              height: 1.3.h,
              fontSize: 16.sp,
              maxLines: 10,
            )
          : Column(
              children: [
                CustomTextPoppines(
                  text: hiddenText
                      ? ("$firstHalf . . . .")
                      : (firstHalf + secondHalf),
                  color: AppTheme.greyColor909090,
                  height: 2.0.h,
                  fontSize: 14.sp,
                  maxLines: 100,
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      CustomTextPoppines(
                        text: hiddenText ? "Show more" : "Show Less",
                        color: GloabalVariables.buttonRed,
                        fontSize: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        hiddenText
                            ? CupertinoIcons.chevron_down
                            : CupertinoIcons.chevron_up,
                        color: GloabalVariables.buttonRed,
                        size: 18.sp,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
