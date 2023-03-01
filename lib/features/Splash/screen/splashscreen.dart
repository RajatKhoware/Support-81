import 'package:support__81/common/button.dart';
import 'package:support__81/common/snakebar.dart';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/features/Auth/screens/sign-in.dart';
import 'package:support__81/features/Auth/screens/sign-up.dart';
import 'package:support__81/features/Auth/services/auth_serices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/customtext.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AuthServices authServices = AuthServices();
  @override
  void initState() {
    super.initState();
    authServices.verifyUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) {
        return Scaffold(
          key: _scaffoldKey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash-1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                  top: 550.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          '''Support 81 is an official merchandise\nstore for the Hells Angels Motorcycle\nClub, providing clothes, accessories
                  and information.''',
                      fontSize: 18.sp,
                      color: primaryWhite,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        CustomButton(
                          width: 160.w,
                          height: 50.h,
                          color: buttonRed,
                          text: "Join Us",
                          fontSize: 15.sp,
                          onTap: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SignUpScreen(),
                            );
                          },
                        ),
                        SizedBox(width: 20.w),
                        CustomButtonWithBorder(
                          width: 160.w,
                          height: 50.h,
                          color: Colors.transparent,
                          text: "Sign In",
                          fontSize: 15.sp,
                          isBorder: true,
                          borderColor: Colors.white,
                          onTap: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SignInScreen(),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
