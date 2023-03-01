// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/common/button.dart';
import 'package:flutter/material.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_appbar.dart';
import '../widget/order_summery_card.dart';
import '../widget/payment_delivery_card.dart';
import '../widget/shipping_card.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "Check out",
                fontSize: 18.sp,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const Shipping_address(),
                  SizedBox(height: 15.h),
                  const CheckOutCards(
                    headingText: "Payment",
                    image: "assets/images/card.png",
                    containtText: "**** **** **** 3947",
                  ),
                  SizedBox(height: 15.h),
                  const CheckOutCards(
                    headingText: "Delivery method",
                    image: "assets/images/Logo.png",
                    containtText: "Fast (2-3days)",
                  ),
                  SizedBox(height: 20.h),
                  const OrderSummeyCard(),
                  SizedBox(height: 28.h),
                  CustomButton(
                    width: double.infinity,
                    height: 55.h,
                    color: GloabalVariables.buttonRed,
                    text: "Submit order",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    onTap: () {
                      Navigator.pushNamed(context, "/order-placed");
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
