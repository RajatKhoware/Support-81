// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Profile/screens/change_password.dart';
import '../widget/profile_textfield.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        backgroundColor: AppTheme.darkRedColor,
        elevation: 0.0,
        leading: SizedBox(),
        actions: [
          Icon(Icons.share, color: Colors.white),
          15.hs,
        ],
      ),
      body: Column(children: [
        // Profile Picture
        SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 90.h,
                  color: AppTheme.darkRedColor,
                ),
              ),
              Positioned(
                child: Row(
                  children: [
                    10.hs,
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    15.hs,
                    CustomTextPoppines(
                      text: "Settings",
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 135.w,
                bottom: 0,
                child: Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.w,
                      color: Colors.blue,
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Man.png"),
                      fit: BoxFit.cover,
                      scale: 1,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Fields
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  30.vs,
                  ProfileTextField(
                    fieldName: "User Name",
                    hintText: "John Doe",
                  ),
                  ProfileTextField(
                    fieldName: "Email I'd",
                    hintText: "youremail@gmail.com",
                  ),
                  ProfileTextField(
                    fieldName: "Phone Number",
                    hintText: "+14955559999",
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ChangePassword.routeName,
                    ),
                    child: ProfileTextField(
                      fieldName: "Change Password",
                      hintText: "feivnRNfadf",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: CustomButton(
          width: double.infinity,
          height: 55.h,
          color: AppTheme.darkRedColor,
          text: "Update",
        ),
      ),
    );
  }
}
