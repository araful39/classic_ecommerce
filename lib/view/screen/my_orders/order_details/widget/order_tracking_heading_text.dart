import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class OrderTrackingHeadingTextWidget extends StatelessWidget {
  const OrderTrackingHeadingTextWidget({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomTextWidget(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontColor: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextWidget(
            text: ":",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontColor: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomTextWidget(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Normal",
            fontColor: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
      ],
    );
  }
}
