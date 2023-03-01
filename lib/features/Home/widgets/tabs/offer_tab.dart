
import '../../../../common/customtext.dart';
import 'package:flutter/material.dart';

class OfferTab extends StatelessWidget {
  const OfferTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CustomText(
            text: "offer",
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}