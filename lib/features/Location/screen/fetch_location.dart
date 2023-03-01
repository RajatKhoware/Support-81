import 'package:support__81/common/button.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/features/Location/widget/dropdownbutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/customtext.dart';
import '../../../constant/colors.dart';

class FetchLocationScreen extends StatefulWidget {
  static const String routeName = '/location';
  const FetchLocationScreen({super.key});

  @override
  State<FetchLocationScreen> createState() => _FetchLocationScreenState();
}

class _FetchLocationScreenState extends State<FetchLocationScreen> {
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  //Stores near you
                  Center(
                    child: InkWell(
                      onTap: () {
                        // print(_stores);
                      },
                      child: CustomText(
                        text: "Stores near you",
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  //Select a store from the drop down
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppTheme.greyColor1F1F1F,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.w.h),
                      child: CustomText(
                        text: "Select a store from the drop down",
                        fontSize: 14.sp,
                        color: AppTheme.whiteColorFFFFFF,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  //Select Store
                  const DropdownForStore(),
                  //Map
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    child: Container(
                        width: double.infinity,
                        height: 445.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150.r),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: Image.asset(
                                "assets/images/Maps.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 20.h,
                              left: 120.w,
                              child: Image.asset(
                                "assets/images/pin.png",
                              ),
                            ),
                            Positioned(
                              bottom: 90.h,
                              right: 18.w,
                              child: Image.asset(
                                "assets/images/pin.png",
                              ),
                            ),
                            Positioned(
                              top: 95.h,
                              right: 60.w,
                              child: Image.asset(
                                "assets/images/pin.png",
                              ),
                            ),
                            Positioned(
                              top: 70.h,
                              left: 30.w,
                              child: Image.asset(
                                "assets/images/pin.png",
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 10.h),
                  //Continue Button
                  CustomButton(
                    width: double.infinity,
                    height: 50.h,
                    color: buttonRed,
                    text: "Continue",
                    fontSize: 15.sp,
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                ],
              ),
            )),
          );
        });
  }
}

// class ShowList extends StatefulWidget {
//   const ShowList({super.key});

//   @override
//   State<ShowList> createState() => _ShowListState();
// }

// class _ShowListState extends State<ShowList> {
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchStore();
  // }

  // Future<void> _fetchStore() async {
  //   final storeService = FetchStoreServices();
  //   final stores = await storeService.fetchStores(
  //     context: context,
  //     lat: "28.391018",
  //     long: "77.416721",
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder<StoreModel>(
//           future: FetchStoreServices().fetchStores(
//             context: context,
//             lat: "28.391018",
//             long: "77.416721",
//           ),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final storeModel = snapshot.data!;
//               return ListView.builder(
//                 itemCount: storeModel.data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final StoreData store = storeModel.data![index];
//                   return ListTile(
//                     title: Text(store.shopName!),
//                     leading: Text(store.id!),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
