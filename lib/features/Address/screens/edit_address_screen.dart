// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/screens/added_address.dart';
import 'package:support__81/features/Address/services/address_services.dart';

import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/app_theme.dart';
import '../../Profile/widget/profile_textfield.dart';
import '../widget/country_dropdown_button.dart';

class EditAddressScreen extends StatefulWidget {
  static const String routeName = '/edit-address';
  const EditAddressScreen({
    Key? key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.firstAddress,
    required this.country,
    required this.mobileNumber,
  }) : super(key: key);
  final String id;
  final String firstName;
  final String lastName;
  final String firstAddress;
  final String country;
  final String mobileNumber;

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  AddressServices addressServices = AddressServices();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstAddressController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    if (firstNameController.text.isEmpty) {
      firstNameController.text = widget.firstName;
    }
    if (lastNameController.text.isEmpty) {
      lastNameController.text = widget.lastName;
    }
    if (firstAddressController.text.isEmpty) {
      firstAddressController.text = widget.firstAddress;
    }
    if (mobileNumberController.text.isEmpty) {
      mobileNumberController.text = widget.mobileNumber;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    firstAddressController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  Future<void> editAddress() async {
    setState(() {
      isWaiting = true;
    });
    await addressServices.updateAddress(
      context: context,
      id: widget.id,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      mobileNumber: int.parse(mobileNumberController.text),
      fullAddress1: firstAddressController.text,
      country: widget.country.toString(),
    );
    addressServices.getAddress(context: context);
    Navigator.pushNamed(context, AddedAddress.routeName);
    setState(() {
      isWaiting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Edit Address",
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
                fieldName: "First Name",
                controller: firstNameController,
              ),
              10.vs,
              ProfileTextField(
                hintText: "Last Name",
                fieldName: "Last Name",
                controller: lastNameController,
              ),
              10.vs,
              ProfileTextField(
                hintText: "Mobile Number",
                fieldName: "Mobile Number",
                controller: mobileNumberController,
              ),
              10.vs,
              ProfileTextField(
                hintText: "Street Address",
                fieldName: "Street Address",
                controller: firstAddressController,
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
          text: isWaiting ? "Wait" : "Update Address",
          fontWeight: FontWeight.bold,
          onTap: () {
            editAddress();
          },
        ),
      ),
    );
  }
}
