// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Rating%20&%20Review/screens/rate_review_screen.dart';
import 'package:support__81/models/product_details_model.dart';
import '../../../common/customtext.dart';
import '../../../provider/cart_provider.dart';

class ProductDetaileColumn extends StatefulWidget {
  final String? productPrice;
  final double productId;
  final double avgRating;
  final List<Sizes>? productSizes;

  const ProductDetaileColumn({
    Key? key,
    this.productPrice = "\$ 25",
    required this.productId,
    required this.avgRating,
    required this.productSizes,
  }) : super(key: key);

  @override
  State<ProductDetaileColumn> createState() => _ProductDetaileColumnState();
}

class _ProductDetaileColumnState extends State<ProductDetaileColumn> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final quantityAtCI =
        int.parse(widget.productSizes![cart.productSize].quantity!);
    return Column(
      children: [
        // Product Name
        CustomTextPoppines(
          text:
              "Hells Angels 81 Anniversary Black Jacket Support81 Big Red Machine",
          fontSize: 19.sp,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.normal,
        ),
        8.vs,
        //Rate and Reviews
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RateAndReviewScreen.routeName,
              arguments: widget.productId,
            );
          },
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Color.fromARGB(255, 255, 209, 59),
              ),
              5.hs,
              CustomTextPoppines(
                text: "4.5",
                //text: avgRating.toString(),
                fontSize: 18.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              16.hs,
              CustomTextPoppines(
                text: "(50 reviews)",
                fontSize: 14.sp,
                color: AppTheme.greyColor909090,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
        15.vs,
        // Select size
        SizedBox(
          height: quantityAtCI <= 15 ? 65.h : 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productSizes!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  cart.setProductSize(index);
                  print(cart.productSize);
                  cart.setInitalQuantity();
                },
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: cart.productSize == index
                            ? AppTheme.darkRedColor
                            : AppTheme.greyColor2B2B2B,
                      ),
                      child: Center(
                        child: CustomTextPoppines(
                          text: widget.productSizes![index].initial.toString(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (quantityAtCI <= 15) 10.vs,
                    if (int.parse(widget.productSizes![index].quantity!) <= 15)
                      Visibility(
                        visible: cart.productSize == index,
                        child: CustomText(
                          text: "${widget.productSizes![index].quantity} left",
                          color: AppTheme.redPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        15.vs,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Price of Product
            CustomTextPoppines(
              text: "\$${widget.productPrice}",
              fontSize: 32.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
            // Qunatity Inc Dec Button
            SizedBox(
              width: 113.w,
              height: 30.h,
              child: Row(children: [
                cart.initalQuantity ==
                        int.parse(
                          widget.productSizes![cart.productSize].quantity
                              .toString(),
                        )
                    ? SizedBox(width: 28.w)
                    : Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.6),
                        ),
                        child: InkWell(
                          onTap: () => cart.increaseInitalQuantity(
                            int.parse(
                              widget.productSizes![cart.productSize].quantity
                                  .toString(),
                            ),
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 18.sp,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.6),
                          ),
                        ),
                      ),
                SizedBox(width: 14.w),
                CustomTextInter(
                  text: cart.initalQuantity.toString(),
                  fontSize: 18.sp,
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 14.w),
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Theme.of(context).dividerColor.withOpacity(0.6),
                  ),
                  child: InkWell(
                    onTap: () => cart.decreaseInitalQuantity(),
                    child: Icon(
                      CupertinoIcons.minus,
                      size: 18.sp,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
