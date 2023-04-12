// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:support__81/common/button.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Profile/screens/change_password.dart';
import 'package:support__81/features/Profile/services/profile_services.dart';
import 'package:support__81/provider/user_provider.dart';
import '../widget/profile_textfield.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileService profileService = ProfileService();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  Future<void> updateUserDetails() async {
    await profileService.updateUserInfo(
      context: context,
      name: userNameController.text,
      email: emailController.text,
      mobile: mobileController.text,
    );
    profileService.getUser(context);
    userNameController.clear();
    emailController.clear();
    mobileController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: true).user;
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
          height: 170.h,
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
                child: Column(
                  children: [
                    Container(
                      width: 140.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/Man.png"),
                          fit: BoxFit.cover,
                          scale: 1,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    10.vs,
                    CustomTextPoppines(
                      text: "Chnage Photo",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppTheme.greyColor909090,
                    ),
                  ],
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
                    hintText: user.name,
                    controller: userNameController,
                  ),
                  ProfileTextField(
                    fieldName: "Email I'd",
                    hintText: user.email,
                    controller: emailController,
                  ),
                  ProfileTextField(
                    fieldName: "Phone Number",
                    hintText: user.mobile,
                    controller: mobileController,
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
          onTap: () => updateUserDetails(),
        ),
      ),
    );
  }
}
