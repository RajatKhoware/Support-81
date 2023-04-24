// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProductColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  const ProductColorPicker({
    Key? key,
    required this.outerBorder,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBorder
              ? Border.all(
                  width: 3.w,
                  color: Colors.white,
                )
              : null,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

