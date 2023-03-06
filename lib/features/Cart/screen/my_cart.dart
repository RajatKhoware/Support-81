// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/common/app_list.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              child: Column(
                children: [
                  if (cart.data == null)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 160.r,
                              backgroundColor: AppTheme.blackColor242424,
                              child: Image.asset(
                                "assets/images/empty_basket.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            CustomTextPoppines(
                              text:
                                  "Oops! Look like your cart is \n                   empty",
                              fontSize: 16.sp,
                              color: AppTheme.greyColor909090,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
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
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        //Promo-code Field
                        SizedBox(height: 18.h),
                        //Cart Total
                        if (cart.data != null)
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
                          text:
                              cart.data == null ? "Go Shopping!" : "Check out",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          onTap: () {
                            cart.data == null
                                ? Navigator.pushNamed(context, "/home")
                                : Navigator.pushNamed(context, "/check-out");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
