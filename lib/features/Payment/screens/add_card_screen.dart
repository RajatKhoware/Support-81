import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Profile/widget/profile_textfield.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/app_theme.dart';

class AddCard extends StatelessWidget {
  static const String routeName = '/add-card';
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Add Card",
          fontSize: 18.sp,
          isCenterTitle: false,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w.h),
        child: Column(children: [
          10.vs,
          ProfileTextField(
            hintText: "Enter Card Number",
            fieldName: "Card Number",
          ),
          Row(
            children: [
              Expanded(
                child: ProfileTextField(
                  hintText: "Expiration Date",
                  fieldName: "Expiration Date",
                ),
              ),
              10.hs,
              Expanded(
                child: ProfileTextField(
                  hintText: "Security Code",
                  fieldName: "Security Code",
                ),
              )
            ],
          ),
          ProfileTextField(
            hintText: "Enter Card Holder",
            fieldName: "Card Holder",
          )
        ]),
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
          text: "Add Card",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
