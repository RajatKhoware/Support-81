import 'package:flutter/material.dart';
import '../../../common/customtext.dart';
import '../../../constant/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummeyCard_Widget extends StatelessWidget {
  const OrderSummeyCard_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          // ThemeMode.dark as bool
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            offset: const Offset(0, 8),
            blurRadius: 20.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15.w.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Order",
                  fontSize: 18.sp,
                  color: AppTheme.greyColor909090,
                ),
                CustomText(
                  text: "Dilvery",
                  fontSize: 18.sp,
                  color: AppTheme.greyColor909090,
                ),
                CustomText(
                  text: "Total",
                  fontSize: 18.sp,
                  color: AppTheme.greyColor909090,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPoppines(
                  text: "\$ 85.00",
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextPoppines(
                  text: "\$ 5.00",
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextPoppines(
                  text: "\$ 90.00",
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
