import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/services/address_services.dart';
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
  AddressServices addressServices = AddressServices();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstAddressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  String? selectedCountry = "India";
  bool isWaiting = false;

  @override
  void dispose() {
    firstAddressController.dispose();
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
      mobileNumber: int.parse(mobileNumberController.text),
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

class CountryDropDown_Widget extends StatefulWidget {
  const CountryDropDown_Widget({super.key});

  @override
  State<CountryDropDown_Widget> createState() => _CountryDropDown_WidgetState();
}

class _CountryDropDown_WidgetState extends State<CountryDropDown_Widget> {
  String? _selectedStore;
  String? _hoverItem;
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
            dropdownColor: AppTheme.darkRedColor,
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
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: MouseRegion(
                      onHover: (event) {
                        setState(() {
                          _hoverItem = value;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          _hoverItem = null;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: value == _hoverItem
                              ? Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
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
