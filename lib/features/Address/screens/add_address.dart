import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/extensions.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/customtext.dart';
import '../../../constant/app_theme.dart';
import '../../Profile/widget/profile_textfield.dart';

class AddAddress extends StatefulWidget {
  static const String routeName = '/add-address';
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Add Address",
          fontSize: 18.sp,
          isCenterTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.w.h),
          child: Column(
            children: [
              10.vs,
              CountryDropDown_Widget(),
              10.vs,
              ProfileTextField(
                hintText: "First Name",
                fieldName: "Enter First Name",
              ),
              10.vs,
              ProfileTextField(
                hintText: "Last Name",
                fieldName: "Enter Last Name",
              ),
              10.vs,
              ProfileTextField(
                hintText: "Street Address",
                fieldName: "Enter Street Address",
              ),
              10.vs,
              ProfileTextField(
                hintText: "Street Address 2 (Optional)",
                fieldName: "Enter Street Address 2",
              ),
            ],
          ),
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
          text: "Add Address",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CountryDropDown_Widget extends StatefulWidget {
  const CountryDropDown_Widget({super.key});

  @override
  State<CountryDropDown_Widget> createState() => _CountryDropDown_WidgetState();
}

class _CountryDropDown_WidgetState extends State<CountryDropDown_Widget> {
  String? _selectedStore;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, bottom: 10.h),
          child: CustomTextPoppines(
            text: "Country or region",
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppTheme.whiteColorFFFFFF,
            ),
          ),
          child: DropdownButton<String>(
            value: _selectedStore,
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20.r),
            dropdownColor: AppTheme.redPrimaryColor,
            iconSize: 20.sp,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            underline: SizedBox(),
            onChanged: (newValue) {
              setState(() {
                _selectedStore = newValue!;
              });
            },
            //List of items present in list
            items: <String>['United States', 'UK', 'England', 'India']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                );
              },
            ).toList(),
            isExpanded: true,
            hint: Text(
              'United States',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
