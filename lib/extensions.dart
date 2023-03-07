import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomPadding on num {
  SizedBox get vs => SizedBox(height: toDouble().h);
  SizedBox get hs => SizedBox(width: toDouble().w);
}
