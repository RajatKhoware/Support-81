// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/common/snakebar.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Cart/services/cart_services.dart';
import 'package:support__81/provider/cart_provider.dart';

class CartProductTile extends StatefulWidget {
  final int index;

  const CartProductTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProductTile> createState() => _CartProductTileState();
}

class _CartProductTileState extends State<CartProductTile> {
  CartServices _cartServices = CartServices();

  Future<void> increaseQuantity(String cartId) async {
    await _cartServices.addToCart(
      context: context,
      cartId: cartId,
    );
  }

  Future<void> removeFromCart(String cartId) async {
    await _cartServices.removeFromCart(
      context: context,
      cartId: cartId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartProduct = cart.cart.data![widget.index].addedProduct;
    final cartList = cart.cart.data![widget.index];
    return Column(
      children: [
        Container(
          width: 335.w,
          height: 100.h,
          color: Colors.transparent,
          child: Row(
            children: [
              //Image Container
              InkWell(
                onTap: () {},
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Image.network(
                    cartProduct!.images!.isEmpty
                        ? "https://cdn.shopify.com/s/files/1/0265/1435/8377/products/vans-old-skool-ideas-that-connect-custom-621721.jpg?v=1625258141&width=2048"
                        : cartProduct.images!.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              20.hs,
              //Detailes + Price + Qunatity
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 350.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextPoppines(
                        text: cartProduct.productName.toString(),
                        fontSize: 14.sp,
                        color: AppTheme.greyColor909090,
                        maxLines: 1,
                      ),
                      MediaQuery.of(context).size.height > 820 ? 6.vs : 8.vs,
                      CustomTextPoppines(
                        text: "\$ ${cartProduct.price}",
                        fontSize: 16.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      MediaQuery.of(context).size.height > 820 ? 10.vs : 14.vs,
                      //Qunatity
                      SizedBox(
                        width: 113.w,
                        height: 30.h,
                        child: Row(children: [
                          Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.6),
                            ),
                            child: InkWell(
                              onTap: () =>
                                  increaseQuantity(cartList.cartId.toString()),
                              child: Icon(
                                CupertinoIcons.plus,
                                size: 18.sp,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                              ),
                            ),
                          ),
                          14.hs,
                          CustomTextInter(
                            text: cartList.quantity.toString(),
                            fontSize: 18.sp,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                          14.hs,
                          Container(
                            width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.6),
                            ),
                            child: InkWell(
                              onTap: () {
                                showSnakeBar(
                                  context,
                                  "This feature is not working",
                                );
                              },
                              child: Icon(
                                CupertinoIcons.minus,
                                size: 18.sp,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              //Delete Button
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await removeFromCart(cartProduct.id.toString());
                      cart.removeProduct(widget.index);
                    },
                    child: Icon(
                      CupertinoIcons.xmark_circle,
                      color: Theme.of(context).primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Divider(
            height: 1.0.h,
            thickness: 1.0.h,
            color: Theme.of(context).dividerColor,
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
