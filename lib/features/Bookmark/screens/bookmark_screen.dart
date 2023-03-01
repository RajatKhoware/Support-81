// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:support__81/provider/bookmark_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/features/Bookmark/services/bookmark_services.dart';
import 'package:support__81/features/Home/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import '../../../constant/app_theme.dart';
import '../../Home/widgets/floating_action_button.dart';
import '../../Home/widgets/searchfield.dart';
import '../widget/bookmark_product_widget.dart';

class BookMarkScreen extends StatefulWidget {
  static const String routeName = '/bookmarkScreen';
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  BookmarkServices _bookmarkServices = BookmarkServices();

  @override
  void initState() {
    super.initState();
    fetchBookmarkProducts();
  }

  void fetchBookmarkProducts() {
    _bookmarkServices.getBookmarkedProducts(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkedProducts =
        Provider.of<BookmarkedProvider>(context).products;
    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) {
        return Scaffold(
          drawer: MyDrawer(),
          floatingActionButton: FloadtingActionButton(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: AppTheme.greyColor909090,
            ),
            titleSpacing: 0.0,
            title: Container(
              width: 320.w,
              height: 38.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: const SerachField(),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: InkWell(
                  onTap: () {
                    print(bookmarkedProducts[0].addedProduct!.productName);
                  },
                  child: CustomTextPoppines(
                    text: "My Bookmarks",
                    fontSize: 24.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(left: 25.w, bottom: 10.h),
                  itemCount: bookmarkedProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width > 383
                        ? 1 / 1.65
                        : 1 / 1.40,
                  ),
                  itemBuilder: (context, index) {
                    final product = bookmarkedProducts[index].addedProduct!;
                    return Bookmark_product_widget(
                      productId: product.id!.toDouble(),
                      productImg: product.images![0].toString(),
                      productName: product.productName.toString(),
                      productPrice: product.price.toString(),
                    );
                  },
                ),
              )
              // Expanded(
              //   child: MyFutureBuilder(
              //     future:
              //         _bookmarkServices.getBookmarkedProducts(context: context),
              //     builder: (context, data) {
              //       return Column(
              //         children: [
              //           Expanded(
              //             child: GridView.builder(
              //               padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
              //               itemCount: data.data!.length,
              //               gridDelegate:
              //                   SliverGridDelegateWithFixedCrossAxisCount(
              //                 crossAxisCount: 2,
              //                 childAspectRatio:
              //                     MediaQuery.of(context).size.width > 383
              //                         ? 1 / 1.65
              //                         : 1 / 1.40,
              //               ),
              //               itemBuilder: (context, index) {
              //                 final product = data.data![index].addedProduct!;
              //                 return Bookmark_product_widget(
              //                   productId: product.id!.toDouble(),
              //                   productImg: product.images![0].toString(),
              //                   productName: product.productName.toString(),
              //                   productPrice: product.price.toString(),
              //                 );
              //               },
              //             ),
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
