import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/extensions.dart';
import '../../../common/button.dart';
import '../../../common/customtext.dart';
import '../../../constant/app_theme.dart';
import '../widget/profile_textfield.dart';

class ChangePassword extends StatelessWidget {
  static const String routeName = '/change_password';
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        elevation: 0.0,
        leading: SizedBox(),
        actions: [Icon(Icons.share, color: Colors.white), 15.hs],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
                10.hs,
                CustomTextPoppines(
                  text: "Change Password",
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ],
            ),
            30.vs,
            ProfileTextField(
              fieldName: "Enter old Password",
              hintText: "fdjkcd",
            ),
            ProfileTextField(
              fieldName: "New Password",
              hintText: "jdkvkdk",
            ),
          ],
        ),
      ),
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
