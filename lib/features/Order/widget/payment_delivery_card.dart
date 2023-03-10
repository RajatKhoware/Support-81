// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/features/Payment/screens/added_cards.dart';

import '../../../common/customtext.dart';
import '../../../common/snakebar.dart';

//Payment + Delivery card
class CheckOutCards extends StatelessWidget {
  final String headingText;
  final String image;
  final String containtText;
  final bool isPaymentCard;
  const CheckOutCards({
    Key? key,
    required this.headingText,
    required this.image,
    required this.containtText,
    required this.isPaymentCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextInter(
              text: headingText,
              fontSize: 18.sp,
              color: AppTheme.greyColor909090,
            ),
            InkWell(
              onTap: () {
                isPaymentCard
                    ? Navigator.pushNamed(context, AddedCards.routeName)
                    : showSnakeBar(context, "Working on it");
              },
              child: Icon(
                FontAwesomeIcons.solidPenToSquare,
                color: Theme.of(context).primaryColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 68.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                offset: const Offset(0, 8),
                blurRadius: 20.r,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Image.asset(image),
              SizedBox(width: 10.w),
              CustomText(
                text: containtText,
                fontSize: 15.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        )
      ],
    );
  }
}
