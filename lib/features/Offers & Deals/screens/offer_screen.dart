import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/features/Home/widgets/custom_gridview.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../../common/snakebar.dart';
import '../widget/carousel_img.dart';

class OfferAndDealsScreen extends StatefulWidget {
  const OfferAndDealsScreen({super.key});

  @override
  State<OfferAndDealsScreen> createState() => _OfferAndDealsScreenState();
}

class _OfferAndDealsScreenState extends State<OfferAndDealsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "Offers & Deals",
                fontSize: 18.sp,
                iconSize: 25.sp,
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 15.h),
                Stack(children: [
                  OfferCarouselImgs(),
                  Positioned(
                    right: 20.w,
                    bottom: 30.h,
                    child: CustomButton(
                      width: 70.w,
                      height: 22.h,
                      color: Theme.of(context).canvasColor,
                      text: "Buy Now",
                      fontSize: 10.sp,
                      fontColor: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      onTap: () {
                        showSnakeBar(context,
                            "No clue so this feature is not spported Yet!");
                      },
                    ),
                  ),
                ]),
                Expanded(
                  child: CustomGridView(
                    isOfferProducts: true,
                  ),
                )
              ],
            ),
          );
        });
  }
}
