import 'package:support__81/common/customtext.dart';
import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: SizedBox(
        width: double.infinity,
        height: 197.h,
        //color: Colors.white.withOpacity(0.3),
        child: Row(
          children: [
            //Date and Day of Events in red box
            Container(
              width: 50.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: GloabalVariables.buttonRed,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  //Day
                  CustomText(
                    text: "FRI",
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: 5.h),
                  //Date
                  CustomText(
                    text: "6",
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Period of event
                CustomText(
                  text: "January 6, 2023 - January 9, 2023",
                  color: Theme.of(context).primaryColor,
                  fontSize: screenHeight > 820 ? 12.sp : 14.sp,
                ),
                SizedBox(height: 10.h),
                // Event Name
                CustomText(
                  text: "Motorcycle rally 2023",
                  fontSize: screenHeight > 820 ? 18.sp : 20.sp,
                  color: Theme.of(context).primaryColor,
                ),
                // Event description
                SizedBox(height: 5.h),
                CustomText(
                  text: '''South Dakota Sturgis Motorcycle Rally in Sturgis,
South Dakota 
\nMotorcycle rallies are a way for bikers to come 
together to celebrate their shared passion. In 2021
many events have been scheduled and many riders are
planning to attend rallies all around the US. Events
feature motorcycle giveaways, races, stunts, music
festivals, and more...''',
                  maxLine: 100,
                  fontSize: screenHeight > 820 ? 8.sp : 10.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
