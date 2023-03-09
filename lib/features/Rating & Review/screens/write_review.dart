import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:support__81/common/customtext.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/extensions.dart';
import '../../../common/button.dart';
import '../../../common/custom_appbar.dart';
import '../../Profile/widget/profile_textfield.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({super.key});

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  double ratingVal = 4.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: CustomAppBar(
          title: "Add Address",
          fontSize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPoppines(
              text:
                  "Please write Overall level of satisfaction with your shipping / Delivery Service",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            20.vs,
            Row(
              children: [
                RatingBar.builder(
                  initialRating: ratingVal,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  updateOnDrag: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  onRatingUpdate: (rating) {
                    ratingVal = rating;
                    setState(() {});
                  },
                ),
                10.hs,
                CustomText(text: "${ratingVal.toString()}/5"),
              ],
            ),
            20.vs,
            CustomTextPoppines(
              text: "Write Your Review",
              fontWeight: FontWeight.bold,
            ),
            15.vs,
            ProfileTextField(
              isFieldName: false,
              hintText: "Write your review here.....",
              maxLines: 6,
            ),
            15.vs,
            CustomTextPoppines(
              text: "Add Photo",
              fontWeight: FontWeight.bold,
            ),
            15.vs,
            Container(
              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: 2.0,
                  color: AppTheme.whiteColorFFFFFF,
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
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
          text: "Submit",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
