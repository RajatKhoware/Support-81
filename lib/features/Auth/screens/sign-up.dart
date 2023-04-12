import 'package:support__81/common/textfield.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/features/Auth/services/auth_serices.dart';
import 'package:support__81/features/Location/screen/fetch_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/button.dart';
import '../../../common/customtext.dart';
import '../../../constant/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/user_model.dart';
import '../../../provider/user_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthServices authServices = AuthServices();
  // Key to validate form
  final _signUpFormKey = GlobalKey<FormState>();
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  String _responseMessage = '';

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileNumberController.dispose();
  }

  // void signUpUser() {
  //   authServices.signUpUser(
  //     context: context,
  //     name: _nameController.text,
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //     mobileNumber: _mobileNumberController.text,
  //   );
  // }

  void signUpUsers() async {
    try {
      http.Response res = await http.post(
        Uri.parse('$url/signup'),
        body: {
          "email": _emailController.text,
          "password": _passwordController.text,
          "mobile": _mobileNumberController.text,
          "name": _nameController.text
        },
      );
      print(res.body);
      final responseData = json.decode(res.body);
      if (res.statusCode == 200 && responseData['response_code'] == 200) {
        // If user is successfully created
        final user = User.fromJson(responseData['data']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        await prefs.setString('x-auth-token', responseData['token']);
        print(prefs.getString('x-auth-token'));
        setState(() {
          _responseMessage =
              "${responseData['response_message']} Login With Same credentials"; // Set the response message
        });
        Navigator.pushNamed(
          context,
          FetchLocationScreen.routeName,
        );
      } else {
        // If user already exists
        final responseData = json.decode(res.body);
        setState(() {
          _responseMessage =
              responseData['response_message']; // Set the response message
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _responseMessage = e.toString(); // Set the response message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CustomText(
              text: "JOIN US",
              fontSize: 42.sp,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 3.5.h),
          Center(
            child: CustomText(
              text: "LET'S GET YOU SIGNED UP!",
              fontSize: 12.sp,
              color: AppTheme.blackColor000000.withOpacity(0.3),
            ),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            height: 245.sp,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFieldForSignUp(
                    isNameField: true,
                    controller: _nameController,
                  ),
                  CustomTextFieldForSignIn(
                    isEmailField: true,
                    controller: _emailController,
                  ),
                  CustomTextFieldForSignIn(
                    isEmailField: false,
                    controller: _passwordController,
                  ),
                  CustomTextFieldForSignUp(
                    isNameField: false,
                    controller: _mobileNumberController,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          CustomButton(
            width: 340.w,
            height: 45.h,
            color: buttonRed,
            text: "SIGN UP",
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            onTap: () {
              if (_signUpFormKey.currentState!.validate()) {
                signUpUsers();
              }
            },
          ),
          social_options_for_sign(),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 30.h,
            child: CustomTextPoppines(
              text: _responseMessage,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: "FORGOT DETAILS?",
                    fontSize: 11.sp,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w600),
                CustomText(
                    text: "CREATE ACCOUNT",
                    fontSize: 11.sp,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class social_options_for_sign extends StatelessWidget {
  const social_options_for_sign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 110.w,
        top: 20.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.0.w,
                height: 1.0.h,
                color: Colors.black.withOpacity(0.4),
              ),
              SizedBox(width: 10.h),
              CustomText(
                  text: "OR",
                  fontSize: 12.sp,
                  color: Colors.black.withOpacity(0.4),
                  fontWeight: FontWeight.normal),
              SizedBox(width: 10.h),
              Container(
                width: 40.0.w,
                height: 1.0.h,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              SizedBox(
                width: 22.w,
                height: 22.h,
                child: Image.asset(
                  "assets/icons/apple-logo.png",
                ),
              ),
              SizedBox(width: 30.w),
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: Image.asset(
                  "assets/icons/facebook.png",
                ),
              ),
              SizedBox(width: 30.w),
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: Image.asset(
                  "assets/icons/google.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
