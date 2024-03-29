import 'package:support__81/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/store_services.dart';

class DropdownForStore extends StatefulWidget {
  const DropdownForStore({super.key});

  @override
  State<DropdownForStore> createState() => _DropdownForStoreState();
}

class _DropdownForStoreState extends State<DropdownForStore> {
  String? _selectedStore;
  List<String>? _shopNames;
  String? _hoverItem;

  @override
  void initState() {
    super.initState();
    _fetchStoreData();
  }

  void _fetchStoreData() async {
    final storeService = FetchStoreServices();
    final stores = await storeService.fetchStores(
      context: context,
      lat: "28.391018",
      long: "77.416721",
    );
    setState(() {
      _shopNames =
          stores.data?.map((data) => data.shopName).cast<String>().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _shopNames != null
        ? Container(
            width: double.infinity,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppTheme.greyColor1F1F1F,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            //DropdownButton
            child: DropdownButton<String>(
              value: _selectedStore,
              icon: const Icon(
                CupertinoIcons.chevron_down,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20.r),
              dropdownColor: AppTheme.redPrimaryColor,
              iconSize: 24.sp,
              style: const TextStyle(
                color: Colors.white,
              ),
              underline: SizedBox(),
              onChanged: (newValue) {
                setState(() {
                  _selectedStore = newValue!;
                });
              },
              items: _shopNames!.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
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
                                ? AppTheme.greyColor1F1F1F
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20.r)),
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
                  );
                },
              ).toList(),
              isExpanded: true,
              hint: Text(
                'Select Store',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
