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
import 'package:support__81/models/product_details_model.dart';
import '../../../common/my_future.dart';
import '../../../common/snakebar.dart';
import '../../Bookmark/provider/bookmark_provider.dart';
import '../../../provider/cart_provider.dart';
import '../../Bookmark/screens/bookmark_screen.dart';
import '../widget/product_carsoule_imgs.dart';
import '../widget/product_color_picker.dart';
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
  double currentColorId = -1;

  @override
  void initState() {
    fetchBookmarkProducts();
    getCart();
    super.initState();
  }

  // Add to Bookmark
  Future addBookmark() {
    return _bookmarkServices.addBookmarks(
      productId: widget.productId.toString(),
      colorId: currentColorId,
      context: context,
    );
  }

  // Get Bookmark Products
  void fetchBookmarkProducts() {
    _bookmarkServices.getBookmarkedProducts(context: context);
  }

  // Get cart
  void getCart() {
    _cartServices.getCart(context);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final bookmark = context.watch<BookmarkedProvider>().products;

    // Checking if the product present in the cart or not
    if (cart.cart.data != null) {
      for (var i = 0; i < cart.cart.data!.length; i++) {
        if (cart.cart.data![i].addedProduct!.id == widget.productId) {
          setState(() {
            isProductPresentInCart = true;
          });
        }
      }
    }
    // Checking if the product present in the bookmark list or not
    if (bookmark.length > 0) {
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
          colorId: currentColorId == -1 ? null : currentColorId,
          context: context,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data!.product!;
            currentColorId =
                double.parse(product.currentColor!.color.toString());
            return CustomScrollView(
              slivers: [
                // Appbar
                _buildAppBar(product),
                // Product Details
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 5.h,
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 110.w),
                          height: 25.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: product.availableColors!.length,
                              itemBuilder: (context, index) {
                                AvailableColors availableColors =
                                    product.availableColors![index];
                                final Color productColors = Color(
                                  int.parse("0xFF${availableColors.hex}"),
                                );
                                double colorId = double.parse(
                                    availableColors.color.toString());
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentColor = index;
                                      currentColorId = colorId;
                                    });
                                  },
                                  child: ProductColorPicker(
                                    outerBorder: currentColor == index,
                                    color: productColors,
                                  ),
                                );
                              }),
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
            return Center(child: Text(snapshot.error.toString()));
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
                        onPressed: () {
                          isProductBookmarked
                              ? Navigator.pushNamed(
                                  context,
                                  BookMarkScreen.routeName,
                                )
                              : {
                                  addBookmark(),
                                  showSnakeBar(
                                    context,
                                    data.responseMessage.toString(),
                                  ),
                                };
                          fetchBookmarkProducts();
                        },
                        icon: Icon(
                          CupertinoIcons.heart_fill,
                          color: isProductBookmarked
                              ? AppTheme.redPrimaryColor
                              : AppTheme.greyColor909090,
                          size: 28.sp,
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
                text: isProductPresentInCart ? "Move to cart" : "Add to cart",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontColor: isProductPresentInCart
                    ? AppTheme.redPrimaryColor
                    : AppTheme.whiteColorFFFFFF,
                onTap: () {
                  isProductPresentInCart
                      ? {
                          Navigator.pushNamed(context, "/my-cart"),
                          getCart(),
                        }
                      : {
                          _cartServices.addToCartWithQunatity(
                            context: context,
                            quantity: cart.initalQuantity.toDouble(),
                            productId: widget.productId,
                            colorId: currentColorId,
                            size: (1 + cart.productSize).toDouble(),
                          ),
                          isProductPresentInCart = true,
                          setState(() {}),
                          cart.setInitalQuantity(),
                        };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(Product product) {
    return SliverAppBar(
      expandedHeight: 340.h,
      backgroundColor: Colors.transparent,
      pinned: true,
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace: ProductCarsouleImgs(images: product.image!),
      title: _buildBackButton(),
    );
  }

  Widget _buildBackButton() {
    final cart = context.watch<CartProvider>();
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
        onPressed: () {
          cart.setInitalQuantity();
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: Theme.of(context).primaryColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
