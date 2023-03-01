// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'customtext.dart';

//Text-field with traling icons
class CustomTextFieldForSignIn extends StatefulWidget {
  final bool isEmailField;
  final TextEditingController controller;
  const CustomTextFieldForSignIn({
    Key? key,
    required this.isEmailField,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFieldForSignIn> createState() =>
      _CustomTextFieldForSignInState();
}

class _CustomTextFieldForSignInState extends State<CustomTextFieldForSignIn> {
  bool _showPasswod = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: textfieldBgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 10.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.h,
              width: 240.w,
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      widget.isEmailField ? "Your email" : "Your password",
                  hintStyle: TextStyle(
                    color: AppTheme.blackColor000000,
                    fontWeight: FontWeight.w200,
                    fontSize: 15.sp,
                    fontFamily: "Montserrat",
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                ),
                obscureText: widget.isEmailField ? false : _showPasswod,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter your ${widget.isEmailField ? "Your email" : "Your password"}';
                  }
                  return null;
                },
              ),
            ),
            widget.isEmailField
                ?
                //Email checker container
                Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 12.sp,
                      color: AppTheme.greyColor2B2B2B,
                    ),
                  )
                :
                // Show password button
                InkWell(
                    onTap: () {
                      setState(() {
                        _showPasswod = !_showPasswod;
                      });
                    },
                    child: Container(
                      width: 45.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                      ),
                      child: Center(
                        child: CustomText(
                          text: _showPasswod ? "SHOW" : "HIDE",
                          fontSize: 10.sp,
                          color: primaryWhite,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

//Plan Text-field without any traling icon
class CustomTextFieldForSignUp extends StatelessWidget {
  final bool isNameField;
  final TextEditingController controller;
  const CustomTextFieldForSignUp({
    Key? key,
    required this.isNameField,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: textfieldBgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 22.w),
        child: SizedBox(
          height: 50.h,
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: isNameField ? "Your name" : "Your mobile number",
              hintStyle: TextStyle(
                color: AppTheme.blackColor000000,
                fontSize: 15.sp,
                fontFamily: "Montserrat",
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: "Montserrat",
            ),
            // maxLength: isNameField ? 100 : 10,
            cursorColor: Colors.blue,
            keyboardType:
                isNameField ? TextInputType.text : TextInputType.number,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your ${isNameField ? "Your name" : "Your mobile number"}';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

//Customt text field
class CustomTextField extends StatelessWidget {
  final String hintText;
  final double heightOfField;
  final double widthOfField;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.heightOfField,
    required this.widthOfField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightOfField,
      width: widthOfField,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppTheme.greyColor909090,
                fontSize: 16,
                fontFamily: "Montserrat",
              ),
            ),
            style: TextStyle(
              color: AppTheme.greyColor909090,
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
            cursorColor: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
