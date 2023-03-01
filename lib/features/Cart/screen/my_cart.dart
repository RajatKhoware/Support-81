// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/common/app_list.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/common/textfield.dart';
import 'package:support__81/features/Cart/services/cart_services.dart';
import 'package:support__81/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../../common/custom_appbar.dart';
import '../widget/cart_tile.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true).cart;

    int sum = 0;
    cart.data?.forEach((e) {
      final quantity = int.tryParse(e.quantity ?? '0');
      final price = int.tryParse(e.addedProduct?.price ?? '0');
      sum += (quantity! * price!);
    });

    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            //? Appbar
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "My cart",
              ),
            ),
            //? Cart Products
            body: Padding(
              padding: EdgeInsets.all(10.w.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 475.h,
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cart.data?.length,
                        itemBuilder: (context, index) {
                          return CartProductTile(
                            index: index,
                          );
                        },
                      ),
                    ),
                    //? Promo-code + Total + Check out
                    Container(
                      width: 335.w,
                      height: 180.h,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          //Promo-code Field
                          SizedBox(height: 5.h),
                          Container(
                            width: 335.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: Row(
                              children: [
                                CustomTextField(
                                  hintText: "Enter you promo code",
                                  heightOfField: 44.h,
                                  widthOfField: 290.w,
                                ),
                                Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: GloabalVariables.buttonRed,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.forward,
                                      color: Colors.white.withOpacity(0.9),
                                      size: 28.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18.h),
                          //Cart Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextInter(
                                text: "Total:",
                                fontSize: 20.sp,
                                color: Theme.of(context)
                                    .primaryColorLight
                                    .withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                              ),
                              CustomTextInter(
                                text: "\$${sum.toString()}",
                                fontSize: 20.sp,
                                color: Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          //Check-out Button
                          CustomButton(
                            width: double.infinity,
                            height: 50.h,
                            color: GloabalVariables.buttonRed,
                            text: "Check out",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            onTap: () {
                              Navigator.pushNamed(context, "/check-out");
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
