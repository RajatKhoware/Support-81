import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'customtext.dart';

class QuantityIncDecButton extends StatefulWidget {
  const QuantityIncDecButton({
    Key? key,
  }) : super(key: key);

  @override
  State<QuantityIncDecButton> createState() => _QuantityIncDecButtonState();
}



class _QuantityIncDecButtonState extends State<QuantityIncDecButton> {
  int initialQunaity = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 113.w,
      height: 30.h,
      child: Row(children: [
        Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).dividerColor.withOpacity(0.6),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                initialQunaity = ++initialQunaity;
              });
            },
            child: Icon(
              CupertinoIcons.plus,
              size: 18.sp,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
        SizedBox(width: 14.w),
        CustomTextInter(
          text: initialQunaity.toString(),
          fontSize: 18.sp,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontWeight: FontWeight.w400,
        ),
        SizedBox(width: 14.w),
        Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).dividerColor.withOpacity(0.6),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                if (initialQunaity > 1) {
                  initialQunaity = --initialQunaity;
                }
              });
            },
            child: Icon(
              CupertinoIcons.minus,
              size: 18.sp,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
      ]),
    );
  }
}
