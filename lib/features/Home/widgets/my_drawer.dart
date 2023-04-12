import 'package:provider/provider.dart';
import 'package:support__81/features/About%20us/about_us.dart';
import 'package:support__81/features/Auth/services/auth_serices.dart';
import 'package:support__81/features/Bookmark/screens/bookmark_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:support__81/features/Contact%20us/screens/contact_us.dart';
import '../../../common/button.dart';
import '../../../common/customtext.dart';
import '../../../common/snakebar.dart';
import '../../../provider/user_provider.dart';
import 'drawer_listile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      width: 304.w,
      child: Stack(
        children: [
          // Drawer Img
          Theme.of(context).brightness == Brightness.light
              ? Positioned(
                  left: 30.w,
                  bottom: 5.h,
                  child: Image.asset("assets/images/drawer2.png"),
                )
              : Positioned(
                  left: 130.w,
                  bottom: 5.h,
                  child: Image.asset("assets/images/drawer.png"),
                ),
          // Profile Detailes
          Positioned(
            left: 30.w,
            top: 100.h,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              },
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 35.r,
                      child: Image.asset("assets/images/Boy.png")),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Hello!",
                        color: Theme.of(context).cardColor,
                        fontSize: 18.sp,
                      ),
                      CustomText(
                        text: user.name,
                        color: Theme.of(context).cardColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // Icons
          Positioned(
            top: 160.h,
            left: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                DrawerListTile(
                  icon: Icons.home,
                  text: "Home",
                  onTap: () {
                    Navigator.pushNamed(context, "/home");
                  },
                ),
                DrawerListTile(
                  icon: Icons.shop,
                  text: "Shop Now",
                  onTap: () {
                    Navigator.pushNamed(context, "/home");
                  },
                ),
                DrawerListTile(
                  icon: Icons.info,
                  text: "About Us",
                  onTap: () {
                    Navigator.pushNamed(context, AboutUs.routeName);
                  },
                ),
                DrawerListTile(
                  icon: Icons.phone,
                  text: "Contact Us",
                  onTap: () {
                    Navigator.pushNamed(context, ContactUs.routeName);
                  },
                ),
                DrawerListTile(
                  icon: Icons.notifications,
                  text: "Notification",
                  onTap: () {
                    Navigator.pushNamed(context, "/notification");
                  },
                ),
                DrawerListTile(
                  icon: CupertinoIcons.cart,
                  text: "My Cart",
                  onTap: () {
                    Navigator.pushNamed(context, "/my-cart");
                  },
                ),
                DrawerListTile(
                  icon: Icons.event,
                  text: "Upcoming Event",
                  onTap: () {
                    Navigator.pushNamed(context, "/upcoming-event");
                  },
                ),
              ],
            ),
          ),
          // Logout Button
          Positioned(
            bottom: 60.h,
            left: 70.w,
            child: CustomButton(
              width: 150.w,
              height: 40.h,
              color: Theme.of(context).accentColor,
              text: "Log Out",
              fontColor: Theme.of(context).canvasColor,
              fontWeight: FontWeight.bold,
              onTap: () => AuthServices().logOut(context),
            ),
          )
        ],
      ),
    );
  }
}
