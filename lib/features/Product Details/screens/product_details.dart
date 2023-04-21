// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Bookmark/services/bookmark_services.dart';
import 'package:support__81/features/Cart/services/cart_services.dart';
import 'package:support__81/features/Product%20Details/services/product_details_services.dart';
import 'package:support__81/features/Product%20Details/widget/expanded_desc.dart';
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
  var currentColor = 0;

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

  // Get cart
  void getCart() {
    _cartServices.getCart(context);
    setState(() {});
  }

  // Get Bookmark
  void fetchBookmarkProducts() {
    _bookmarkServices.getBookmarkedProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    final bookmark = context.watch<BookmarkedProvider>().products;

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

    return Scaffold(
      body: FutureBuilder(
        future: _detailsServices.getProductDetails(
          productId: widget.productId,
          context: context,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data!.product!;
            return CustomScrollView(
              slivers: [
                // Appbar
                SliverAppBar(
                  expandedHeight: 340.h,
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  flexibleSpace: ProductImg_widget(images: product.image!),
                  title: _buildBackButton(),
                ),
                // Product Details
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110.w),
                          child: Container(
                            height: 25.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: product.availableColors!.length,
                                itemBuilder: (context, index) {
                                  final Color productColors = Color(
                                    int.parse(
                                        "0xFF${product.availableColors![index].hex}"),
                                  );
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentColor = index;
                                      });
                                    },
                                    child: ColorPicker(
                                      outerBorder: currentColor == index,
                                      color: productColors,
                                    ),
                                  );
                                }),
                          ),
                        ),
                        20.vs,
                        ProductDetaileColumn(
                          productPrice: product.price,
                          productId: product.id!.toDouble(),
                          avgRating: double.parse(product.avgRating!),
                          productSizes: product.sizes,
                        ),
                        10.vs,
                        ExpandableTextWidget(
                          text: product.description.toString(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
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
              // MyFutureBuilder(
              //     future: addBookmark(),
              //     builder: (context, data) {
              //       return Container(
              //         width: 56.w,
              //         height: 56.h,
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: isProductBookmarked
              //                 ? AppTheme.whiteColorFFFFFF
              //                 : Theme.of(context).buttonColor),
              //         child: IconButton(
              //           onPressed: () {
              //             isProductBookmarked
              //                 ? {
              //                     showSnakeBar(
              //                       context,
              //                       data.responseMessage.toString(),
              //                     ),
              //                     Navigator.pushNamed(
              //                       context,
              //                       BookMarkScreen.routeName,
              //                     ),
              //                   }
              //                 : {
              //                     addBookmark(),
              //                     showSnakeBar(
              //                       context,
              //                       data.responseMessage.toString(),
              //                     ),
              //                   };
              //             fetchBookmarkProducts();
              //           },
              //           icon: Icon(
              //             CupertinoIcons.heart_fill,
              //             color: isProductBookmarked
              //                 ? AppTheme.redPrimaryColor
              //                 : AppTheme.greyColor909090,
              //             size: 28.sp,
              //           ),
              //         ),
              //       );
              //     }),
              CustomButton(
                width: 280.w,
                height: 56.h,
                color: isProductPresentInCart
                    ? AppTheme.whiteColorFFFFFF
                    : GloabalVariables.buttonRed,
                text: isProductPresentInCart ? "Move to cart" : "Add to cart",
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
  }

  Widget _buildBackButton() {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppTheme.greyColor2B2B2B,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
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
    );
  }
}

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  const ColorPicker({
    Key? key,
    required this.outerBorder,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBorder
              ? Border.all(
                  width: 3.w,
                  color: Colors.white,
                )
              : null,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class ProductImg_widget extends StatefulWidget {
  final List images;
  const ProductImg_widget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<ProductImg_widget> createState() => _ProductImg_widgetState();
}

class _ProductImg_widgetState extends State<ProductImg_widget> {
  CarouselController _controller = CarouselController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: widget.images
                .map(
                  (e) => Builder(
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          // fit: BoxFit.cover,
                        ),
                        //color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 160.w,
          child: Row(
            children: widget.images
                .asMap()
                .entries
                .map(
                  (e) => InkWell(
                    onTap: () {
                      _controller.animateToPage(e.key);
                    },
                    child: widget.images.length > 1
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            width: _currentPage == e.key ? 25.w : 6.w,
                            height: _currentPage == e.key ? 6.h : 6.h,
                            decoration: BoxDecoration(
                              borderRadius: _currentPage == e.key
                                  ? BorderRadius.circular(20.r)
                                  : null,
                              shape: _currentPage == e.key
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              color: Colors.white.withOpacity(
                                _currentPage == e.key ? 0.9 : 0.4,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
