import 'dart:convert';

import 'package:support__81/common/button.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:support__81/features/Auth/services/auth_serices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/customtext.dart';
import '../../../common/textfield.dart';
import '../../../models/user_model.dart';
import '../../../provider/user_provider.dart';
import '../../Home/screens/homescreen.dart';
import 'sign-up.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthServices authService = AuthServices();
  final _signInFormKey = GlobalKey<FormState>();
  //Taking controllwer as constructor
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _responseMessage = '';

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  Future<void> _signInUser() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$url/login'),
        body: {
          "email": _emailController.text,
          "password": _passwordController.text,
        },
      );

      final responseData = json.decode(res.body);
      if (res.statusCode == 200 && responseData['response_code'] == 200) {
        //
        final user = User.fromJson(responseData['data']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        await prefs.setString('x-auth-token', responseData['token']);
        print(prefs.getString('x-auth-token'));
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );
      } else {
        setState(() {
          _responseMessage =
              responseData['response_message']; // Set the response message
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _responseMessage =
            'An error occurred while signing up. Please try again later.'; // Set the response message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
              text: "SIGN IN",
              fontSize: 40.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 3.5.h),
          Center(
            child: CustomText(
              text: "LET'S GET YOU SIGNED IN!",
              fontSize: 12.sp,
              color: AppTheme.blackColor000000.withOpacity(0.3),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 300.w,
            height: 230.h,
            child: Image.asset(
              "assets/images/Motorcycle.png",
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: _signInFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  CustomTextFieldForSignIn(
                    isEmailField: true,
                    controller: _emailController,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldForSignIn(
                    isEmailField: false,
                    controller: _passwordController,
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
          CustomButton(
            width: 340.w,
            height: 45.h,
            color: buttonRed,
            text: "SIGN IN",
            fontSize: 15.sp,
            onTap: _signInUser,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 20.h,
            child: CustomTextPoppines(
              text: _responseMessage,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 10.h),
          social_options_for_sign(),
          Padding(
            padding: EdgeInsets.only(top: 38.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "FORGOT DETAILS?",
                  fontSize: 11.sp,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: "CREATE ACCOUNT",
                  fontSize: 11.sp,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
