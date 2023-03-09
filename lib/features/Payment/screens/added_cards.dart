// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Payment/screens/add_card_screen.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../widget/payment_card_widget.dart';

class AddedCards extends StatelessWidget {
  static const String routeName = '/cards';
  const AddedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Credit Card And Debit",
          fontSize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(children: [
          Payment_Card_Widget(isGreenGradient: false),
          20.vs,
          Payment_Card_Widget(isGreenGradient: true),
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
          onTap: () => Navigator.pushNamed(context, AddCard.routeName),
        ),
      ),
    );
  }
}
