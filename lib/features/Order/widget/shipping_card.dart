import 'package:support__81/common/snakebar.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:support__81/features/Address/screens/added_address.dart';
import '../../../common/customtext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Shipping address card
// ignore: camel_case_types
class Shipping_address extends StatelessWidget {
  const Shipping_address({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextPoppines(
              text: "Shipping address",
              fontSize: 18.sp,
              color: AppTheme.greyColor909090,
              fontWeight: FontWeight.w600,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddedAddress.routeName);
              },
              icon: Icon(
                FontAwesomeIcons.solidPenToSquare,
                color: Theme.of(context).primaryColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 119.h,
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
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 9.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextPoppines(
                  text: "Jone Doe",
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10.h),
                Divider(
                  height: 1.5.h,
                  thickness: 1.5.h,
                  color: Theme.of(context).dividerColor,
                ),
                SizedBox(height: 10.h),
                CustomTextPoppines(
                  text:
                      "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
                  fontSize: 14.sp,
                  color: AppTheme.greyColor909090,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
