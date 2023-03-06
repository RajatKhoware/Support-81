// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLine;
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.height = 1.2,
    this.maxLine = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize!.sp,
        height: height!.h,
        color: color,
        fontFamily: "Montserrat",
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomTextPoppines extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  const CustomTextPoppines({
    Key? key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.height = 1.4,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        color: color,
        height: height!.h,
      ),
      maxLines: maxLines!,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AutosizePoppiness extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  const AutosizePoppiness({
    Key? key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.height = 1.4,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        color: color,
        height: height!.h,
      ),
      maxLines: maxLines!,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomTextInter extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  const CustomTextInter({
    Key? key,
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
        color: color,
      ),
    );
  }
}
