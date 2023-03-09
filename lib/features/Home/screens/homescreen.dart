// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:support__81/common/app_list.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Home/widgets/searchfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/provider/cart_provider.dart';
import '../../../common/customtext.dart';
import '../../Cart/services/cart_services.dart';
import '../widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartServices _cartServices = CartServices();
  //Tab current index
  int currentIndex = 0;

  void getCart() {
    _cartServices.getCart(context);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true).cart;
    late final cartProductLeng;
    // Checking if cart is null or not
    if (cart.data == null) {
      setState(() {
        cartProductLeng = 0;
      });
    } else {
      setState(() {
        cartProductLeng = cart.cartProductCount;
      });
    }

    return Scaffold(
      // Drawer Icon + Serach Field
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppTheme.greyColor909090,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 28.sp,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        leadingWidth: 30.w,
        title: Container(
          width: 320.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: const SerachField(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Badge(
              position: BadgePosition.topEnd(end: 0.0),
              badgeContent: CustomTextPoppines(
                text: cartProductLeng.toString(),
                fontSize: 10.sp,
              ),
              badgeStyle: BadgeStyle(
                elevation: 0.0,
                badgeColor: Colors.red,
                padding: EdgeInsets.all(4.0),
              ),
              child: InkWell(
                onTap: () {
                  getCart();
                  Navigator.pushNamed(context, "/my-cart");
                  print(MediaQuery.of(context).size.height);
                  print(MediaQuery.of(context).size.width);
                  print("hello");
                },
                child: Icon(
                  CupertinoIcons.bag_fill,
                  size: 28.sp,
                  color: AppTheme.whiteColorFFFFFF,
                ),
              ),
            ),
          ),
          15.hs,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(children: [
          InkWell(
            onTap: () {},
            child: SizedBox(height: 10.h),
          ),
          //Tab bar
          tabBar(),
          //TabBar view
          Expanded(
            child: AppLists.tabScreens[currentIndex],
          ),
        ]),
      ),
      // floatingActionButton: const FloadtingActionButton(),
      drawer: const MyDrawer(),
    );
  }

// TabBar Widget
  Widget tabBar() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80.h,
            width: 290.w,
            child: ListView.builder(
                itemCount: AppLists.tabLables.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 4.5.h, left: 7.w),
                      width: 66.w,
                      height: 80.h,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: currentIndex == index
                                  ? Colors.red
                                  : Theme.of(context).primaryColorDark,
                            ),
                            child: Icon(
                              AppLists.tabIcons[index],
                              color: currentIndex == index
                                  ? Colors.white
                                  : AppTheme.greyColor909090,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(height: 7.h),
                          CustomTextPoppines(
                            text: AppLists.tabLables[index],
                            fontSize: MediaQuery.of(context).size.height > 820
                                ? 10.sp
                                : MediaQuery.of(context).size.height > 790
                                    ? 11.sp
                                    : 12.sp,
                            color: currentIndex == index
                                ? AppTheme.redPrimaryColor
                                : AppTheme.greyColor909090,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(4.5.w.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/offer-page");
              },
              child: Container(
                width: 66.w,
                height: 80.h,
                child: Column(
                  children: [
                    Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).primaryColorDark,
                      ),
                      child: Icon(
                        CupertinoIcons.ticket,
                        color: AppTheme.greyColor909090,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    CustomTextPoppines(
                      text: "Offer",
                      fontSize: 12.sp,
                      color: AppTheme.greyColor909090,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}

// class HomeScreen extends StatefulWidget {
//   static const String routeName = "/home";
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context, listen: false).user;
//     return ScreenUtilInit(
//       designSize: const Size(393, 781),
//       builder: (context, child) {
//         return Scaffold(
//           body: Center(
//             child: CustomText(
//               text: user.email,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
