import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/services/address_services.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/app_theme.dart';
import '../../Profile/widget/profile_textfield.dart';
import '../widget/country_dropdown_button.dart';

class AddAddress extends StatefulWidget {
  static const String routeName = '/add-address';
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  AddressServices addressServices = AddressServices();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstAddressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  String? selectedCountry = "India";
  bool isWaiting = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    firstAddressController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  Future<void> addAddress() async {
    setState(() {
      isWaiting = true;
    });
    await addressServices.addAddress(
      context: context,
      firstName: firstAddressController.text,
      lastName: lastNameController.text,
      mobileNumber: mobileNumberController.text,
      fullAddress1: firstAddressController.text,
      country: selectedCountry.toString(),
    );
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
          text: isWaiting ? "Wait" : "Add Address",
          fontWeight: FontWeight.bold,
          onTap: () => addAddress(),
        ),
      ),
    );
  }
}
