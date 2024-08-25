
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisableButton extends StatelessWidget {
  const DisableButton({super.key,this.buttonWidth});
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      color: AppColors.cardGreyColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SizedBox(
          height: 30,
          width: buttonWidth ?? MediaQuery.sizeOf(context).width,
          child: Center(
            child: CustomTextWidget(
              text: 'continue'.tr,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontColor: AppColors.primaryLightColor,
            ),
          ),
        ),
      ),
    );
  }
}
