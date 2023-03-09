import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/screens/add_address.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/app_theme.dart';
import '../widget/address_card_widget.dart';

class AddedAddress extends StatelessWidget {
  static const String routeName = '/address';
  const AddedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: CustomAppBar(
            title: "Address",
            fontSize: 18.sp,
            isCenterTitle: false,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: [
              Address_Cards_Widget(),
              20.vs,
              Address_Cards_Widget(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          child: CustomButton(
            width: double.infinity,
            height: 55.h,
            color: AppTheme.darkRedColor,
            text: "Add Address",
            fontWeight: FontWeight.bold,
            onTap: () => Navigator.pushNamed(context, AddAddress.routeName),
          ),
        ));
  }
}
