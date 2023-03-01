import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/custom_appbar.dart';
import '../../../constant/colors.dart';
import '../widgets/event_cart.dart';

class UpcomingEventScreen extends StatelessWidget {
  const UpcomingEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 781),
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(55.h),
              child: CustomAppBar(
                title: "Upcoming Events",
                fontSize: 18.sp,
                iconSize: 25.sp,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(children: [
                Expanded(
                    child: ListView(
                  children: const [
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                  ],
                ))
              ]),
            ),
          );
        });
  }
}
