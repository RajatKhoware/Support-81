import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/custom_appbar.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List productImg = [
      "assets/products/cap.png",
      "assets/products/vest.png",
      "assets/products/jacket.png",
      "assets/products/tshirt_pack.png",
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "My Orders",
          fontSize: 18.sp,
        ),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 122.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15.w.h),
                child: Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            productImg[index],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    10.hs,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextPoppines(
                          text: "Order ID: GH3820",
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                        10.vs,
                        SizedBox(
                          width: 283.w,
                          height: 40.h,
                          child: CustomTextPoppines(
                            text:
                                "Hells Angels Cap Support 81 Costa... - Special For your Activity",
                            maxLines: 2,
                            fontSize: 12.sp,
                            color: AppTheme.greyColor909090,
                          ),
                        ),
                        6.vs,
                        CustomTextPoppines(
                          text: "June 3, 2015 5:06 PM",
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ))
      ]),
    );
  }
}
