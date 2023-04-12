import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/my_future.dart';
import 'package:support__81/extensions.dart';
import 'package:support__81/features/Address/screens/add_address.dart';
import 'package:support__81/features/Address/services/address_services.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/app_theme.dart';
import '../widget/address_card_widget.dart';

class AddedAddress extends StatelessWidget {
  static const String routeName = '/address';
  const AddedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddressServices addressServices = AddressServices();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: CustomAppBar(
            title: "Address",
            fontSize: 18.sp,
            isCenterTitle: false,
          ),
        ),
        body: MyFutureBuilder(
          future: addressServices.getAddress(context: context),
          builder: (context, data) {
            final addressList = data.data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: addressList!.length,
                    itemBuilder: (context, index) {
                      final data = addressList[index];
                      return Address_Cards_Widget(
                        fullName:
                            "${data.firstName.toString()} ${data.lastName.toString()}",
                        fullAddress:
                            "${data.addressLine1.toString()}, ${data.country.toString()}",
                        mobileNumber: data.mobile.toString(),
                        onEdit: () {},
                        onDelete: () {},
                      );
                    },
                  ),
                )
              ],
            );
          },
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
            onTap: () => Navigator.pushNamed(context, AddAddress.routeName),
          ),
        ));
  }
}
