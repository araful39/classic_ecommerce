
import 'package:classic_ecommerce/controller/ui_controller/checkout.dart';
 import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodInfo extends StatelessWidget {
  const PaymentMethodInfo({super.key, required this.checkoutController});
   final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSizedBox(height: 25),
        CustomTextWidget(
          text: "payment_method".tr,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        buildSizedBox(height: 10),
        Obx(
          () => Container(
            width: size.width,
            decoration: BoxDecoration(color: Colors.white.withOpacity(.7), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.bg1LightColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: checkoutController.selectMethode.value == "COD" ? Colors.red : Colors.transparent)),
                    child: InkWell(
                      onTap: () {
                        checkoutController.selectMethode.value = "COD";
                       },
                      child: Image.asset(
                        "assets/images/cod.png",
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Custom Size Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
