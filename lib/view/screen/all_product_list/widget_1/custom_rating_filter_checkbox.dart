import 'package:classic_ecommerce/controller/ui_controller/all_shop_product.dart';
import 'package:classic_ecommerce/view/common_widget/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRatingFilterCheckBox extends StatelessWidget {
  const CustomRatingFilterCheckBox({
    super.key,
    required this.controller,
    required this.index,
  });

  final AllShopProductController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 30,
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: WidgetStatePropertyAll(controller.ratingFilterIndex.value == index.toString() ? Colors.red : Colors.white),
              value: controller.ratingFilterIndex.value == index.toString() ? true : false,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                controller.ratingFilterIndex.value = index.toString();
              },
            ),
            CustomRating(ratingStar: index)
          ],
        ),
      ),
    );
  }
}
