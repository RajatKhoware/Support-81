// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:eighty_one_support/common/customtext.dart';
// import 'package:eighty_one_support/constant/colors.dart';

// class CategoryBlocks extends StatelessWidget {
//   final String categoryName;
//   final String categoryImg;
//   const CategoryBlocks({
//     Key? key,
//     required this.categoryName,
//     required this.categoryImg,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 157.w,
//       height: 232.h,
//       child: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18.r),
//               color: GloabalVariables.buttonRed,
//             ),
//             child: Image.network(categoryImg),
//           ),
//           SizedBox(height: 10.h),
//           CustomTextPoppines(
//             text: categoryName,
//             fontSize: 16.sp,
//             color: Theme.of(context).primaryColor,
//             fontWeight: FontWeight.w600,
//           )
//         ],
//       ),
//     );
//   }
// }
