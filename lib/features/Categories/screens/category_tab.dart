import 'package:support__81/features/Categories/services/catergories_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/customtext.dart';
import '../../../constant/colors.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  CategoryServies _categoryServies = CategoryServies();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoryServies.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final categories = snapshot.data!.data!;
          print(categories);
          // if(productsInfo != null && productsInfo.data!.isNotEmpty){ }
          return Column(
            children: [
              Expanded(
                // Showing Products
                child: GridView.builder(
                  padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width > 383
                        ? 1 / 1.65
                        : 1 / 1.40,
                  ),
                  itemBuilder: (context, index) {
                    final categoriesData = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            if (categoriesData.categoryImage != null)
                              // ignore: dead_code
                              Container(
                                width: double.infinity,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                  color: GloabalVariables.buttonRed,
                                  image: DecorationImage(
                                    image: NetworkImage(categoriesData
                                        .categoryImage
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Container(
                                width: double.infinity,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                  color: GloabalVariables.buttonRed,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/category/man.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            SizedBox(height: 10.h),
                            CustomTextPoppines(
                              text: categoriesData.categoryName.toString(),
                              fontSize: 16.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


// SizedBox(
//       width: double.infinity,
//       height: 500.h,
//       child: Padding(
//         padding: EdgeInsets.all(15.w.h),
//         child: Column(
//           children: [
//             SizedBox(height: 20.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 CategoryBlocks(
//                   categoryName: "Men",
//                   categoryImg: "assets/category/man.png",
//                 ),
//                 CategoryBlocks(
//                   categoryName: "Women",
//                   categoryImg: "assets/category/women.png",
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),
//             const CategoryBlocks(
//               categoryName: "Kids",
//               categoryImg: "assets/category/kids.png",
//             )
//           ],
//         ),
//       ),
//     );