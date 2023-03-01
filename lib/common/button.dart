
import 'package:flutter/material.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'customtext.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color? fontColor;
  final String text;
  final bool? isBorder;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    this.fontColor = Colors.white,
    required this.text,
    this.isBorder = false,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: CustomText(
              text: text,
              fontSize: fontSize!.sp,
              color: fontColor,
              fontWeight: fontWeight!),
        ),
      ),
    );
  }
}

class CustomButtonWithBorder extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String text;
  final bool? isBorder;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;

  const CustomButtonWithBorder({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    this.isBorder = false,
    this.borderColor = Colors.black,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            width: isBorder! ? 1.5.w : 0.0,
            color: borderColor!,
          ),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: fontSize!.sp,
            color: primaryWhite,
            fontWeight: fontWeight!,
          ),
        ),
      ),
    );
  }
}
