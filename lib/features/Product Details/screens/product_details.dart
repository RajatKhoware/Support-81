// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:provider/provider.dart';
import 'package:support__81/features/Bookmark/screens/bookmark_screen.dart';
import 'package:support__81/features/Cart/services/cart_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/features/Bookmark/services/bookmark_services.dart';
import 'package:support__81/features/Product%20Details/services/product_details_services.dart';
import 'package:support__81/features/Product%20Details/widget/expanded_desc.dart';
import '../../../common/my_future.dart';
import '../../../common/snakebar.dart';
import '../../../provider/bookmark_provider.dart';
import '../../../provider/cart_provider.dart';
import '../widget/product_detaile_column.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = '/products-details';
  final double productId;
  const ProductDetailsPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductDetailsServices _detailsServices = ProductDetailsServices();
  BookmarkServices _bookmarkServices = BookmarkServices();
  CartServices _cartServices = CartServices();
  bool isProductBookmarked = false;
  bool isProductPresentInCart = false;

  // Bookmark
  Future addBookmark() {
    return _bookmarkServices.addBookmarks(
      productId: widget.productId.toString(),
      context: context,
    );
  }

  // Add to cart
  void addToCart() async {
    await _cartServices.addToCartWithQunatity(
      context: context,
      quantity: 1,
      productId: widget.productId,
    );
  }

  // Get Product Details
  Future productDetails() {
    return _detailsServices.getProductDetails(
      productId: widget.productId,
      context: context,
    );
  }

  void getCart() {
    _cartServices.getCart(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true).cart;
    final bookmark =
        Provider.of<BookmarkedProvider>(context, listen: true).products;

    // Checking if the product present in the cart or not
    if (cart.data != null) {
      for (var i = 0; i < cart.data!.length; i++) {
        if (cart.data![i].addedProduct!.id == widget.productId) {
          setState(() {
            isProductPresentInCart = true;
          });
        }
      }
    }

    // Checking if the product present in the bookmark list or not
    if (bookmark.isNotEmpty) {
      for (var i = 0; i < bookmark.length; i++) {
        if (bookmark[i].addedProduct!.id == widget.productId) {
          setState(() {
            isProductBookmarked = true;
          });
        }
      }
    }

    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) {
        return Scaffold(
          body: MyFutureBuilder(
            future: productDetails(),
            builder: (context, data) {
              final product = data.data;
              return CustomScrollView(
                slivers: [
                  // Appbar with Image + Back Button
                  SliverAppBar(
                    expandedHeight: 340.h,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    // Image
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        product!.image![0],
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    // Back Button
                    title: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppTheme.greyColor2B2B2B,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.05),
                            blurRadius: 15.r,
                            spreadRadius: 2.r,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Theme.of(context).primaryColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    // Bottom Indicator
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(20.h),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                            width: 35.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Product Title, Price, Reviews, Qnatity
                  SliverToBoxAdapter(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        ProductDetaileColumn(
                          productPrice: product.price,
                          productId: product.id!.toDouble(),
                          avgRating: product.avgRating!.toDouble(),
                        ),
                        SizedBox(height: 10.h),
                        ExpandableTextWidget(
                          text: product.description.toString(),
                        ),
                      ],
                    ),
                  ))
                ],
              );
            },
          ),
          //Bottom bar
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 80.h,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyFutureBuilder(
                      future: addBookmark(),
                      builder: (context, data) {
                        return Container(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isProductBookmarked
                                ? AppTheme.whiteColorFFFFFF
                                : Theme.of(context).buttonColor,
                          ),
                          child: IconButton(
                            onPressed: () => isProductBookmarked
                                ? {
                                    showSnakeBar(context,
                                        data.responseMessage.toString()),
                                    Navigator.pushNamed(
                                        context, BookMarkScreen.routeName),
                                  }
                                : {
                                    addBookmark(),
                                    showSnakeBar(context,
                                        data.responseMessage.toString())
                                  },
                            icon: Icon(
                              CupertinoIcons.bookmark_solid,
                              color: isProductBookmarked
                                  ? AppTheme.redPrimaryColor
                                  : AppTheme.greyColor909090,
                              size: 24.sp,
                            ),
                          ),
                        );
                      }),
                  CustomButton(
                    width: 280.w,
                    height: 56.h,
                    color: isProductPresentInCart
                        ? AppTheme.whiteColorFFFFFF
                        : GloabalVariables.buttonRed,
                    text:
                        isProductPresentInCart ? "Move to cart" : "Add to cart",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontColor: isProductPresentInCart
                        ? AppTheme.redPrimaryColor
                        : AppTheme.whiteColorFFFFFF,
                    onTap: () {
                      isProductPresentInCart
                          ? Navigator.pushNamed(context, "/my-cart")
                          : addToCart();
                      getCart();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class ProductDetailsPage extends StatefulWidget {
//   const ProductDetailsPage({super.key});

//   @override
//   State<ProductDetailsPage> createState() => _ProductDetailsPageState();
// }

// class _ProductDetailsPageState extends State<ProductDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GloabalVariables.bgBlack,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Product Img
//             Positioned(
//               left: 0,
//               right: 0,
//               child: Container(
//                 width: double.infinity,
//                 height: 350,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/products/jacket.png"),
//                     fit: BoxFit.contain,
//                   ),
//                   // color: Colors.white.withOpacity(0.3),
//                 ),
//               ),
//             ),
//             // Back Icon
//             Positioned(
//               left: 20,
//               top: 20,
//               child: Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   color: GloabalVariables.buttonColors,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.white.withOpacity(0.1),
//                         offset: const Offset(0, 0),
//                         blurRadius: 15,
//                         spreadRadius: 2)
//                   ],
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     CupertinoIcons.back,
//                     color: Colors.white.withOpacity(0.8),
//                   ),
//                 ),
//               ),
//             ),
//             // Product Details Column
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               top: 305,
//               child: Container(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   // color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Column(
//                   children: const [
//                     ProductDetaileColumn(),
//                     SizedBox(height: 10),
//                     //Description of Product
//                     Expanded(
//                       child: SingleChildScrollView(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: ExpandableTextWidget(
//                           text: _productDesc,
//                         ),
//                       ),
//                     ),
//                     //
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         height: 70,
//         color: GloabalVariables.bgBlack,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 56,
//                 height: 56,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: GloabalVariables.buttonColors,
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     CupertinoIcons.bookmark_solid,
//                     color: Colors.white.withOpacity(0.3),
//                   ),
//                 ),
//               ),
//               const CustomButton(
//                 width: 260,
//                 height: 56,
//                 color: GloabalVariables.buttonRed,
//                 text: "Add to cart",
//                 fontSize: 18,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
