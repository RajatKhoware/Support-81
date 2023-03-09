import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:support__81/common/custom_appbar.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String routeName = '/my-order';
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
            return ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: SizedBox(
                height: 122.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 263.w,
                        child: Column(
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
                                maxLines: 3,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              children: [MyOrderDetails_widget()],
            );
          },
        ))
      ]),
    );
  }
}

class MyOrderDetails_widget extends StatelessWidget {
  const MyOrderDetails_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          // Dilvery Status
          SizedBox(
            width: 260.w,
            height: 40.h,
            child: Stack(children: [
              Positioned(
                top: 20.h,
                child: Container(
                  width: 260.w,
                  height: 2.5.h,
                  color: AppTheme.darkRedColor,
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppTheme.darkRedColor,
                  child: Center(
                    child: Icon(Icons.check),
                  ),
                ),
              ),
              Positioned(
                left: 70.w,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppTheme.darkRedColor,
                  child: Center(
                    child: Icon(CupertinoIcons.cube_box),
                  ),
                ),
              ),
              Positioned(
                right: 70.w,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppTheme.darkRedColor,
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.truck,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppTheme.darkRedColor,
                  child: Center(
                    child: Icon(CupertinoIcons.cube_box_fill),
                  ),
                ),
              ),
            ]),
          ),
          20.vs,
          // Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 270.w,
                child: CustomTextPoppines(
                  text:
                      "Hells Angels Cap Support 81 Costa... - Special For your Activity",
                  fontSize: 12.5.sp,
                  color: AppTheme.greyColor909090,
                ),
              ),
              CustomTextPoppines(
                text: "\$ 20.00",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          20.vs,
          // Tax
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 270.w,
                child: CustomTextPoppines(
                  text: "Tax",
                  fontSize: 12.5.sp,
                  color: AppTheme.greyColor909090,
                ),
              ),
              CustomTextPoppines(
                text: "\$ 5.00",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          10.vs,
          Divider(thickness: 1.8),
          10.vs,
          // Grand Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 270.w,
                child: CustomTextPoppines(
                  text: "Total",
                  fontSize: 12.5.sp,
                  color: AppTheme.greyColor909090,
                ),
              ),
              CustomTextPoppines(
                text: "\$ 25.00",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          20.vs,
          // Return replace button
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              border: Border.all(
                color: Colors.white,
                width: 2.5,
              ),
            ),
            child: Center(
              child: CustomTextPoppines(
                text: "Return / Replace",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          30.vs
        ],
      ),
    );
  }
}
