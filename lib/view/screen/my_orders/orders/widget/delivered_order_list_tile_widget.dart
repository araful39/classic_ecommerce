import 'package:classic_ecommerce/model/delivered_order_list_model.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveredOrderListTileWidget extends StatelessWidget {
  const DeliveredOrderListTileWidget({
    super.key,
    required this.onDetailsTap,
    required this.image,
    required this.controller,
  });
  final VoidCallback onDetailsTap;
  final String image;
  final DeliveryList controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetailsTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(.1), width: 2, strokeAlign: BorderSide.strokeAlignOutside),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: "# ${controller.orderNo}",
                          fontColor: AppColors.bg1LightColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomTextWidget(
                        text: (double.parse(controller.totalPrice.toString()) + double.parse(controller.deliveryCharge ?? "0")).toStringAsFixed(2),
                        fontColor: AppColors.bg1LightColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomTextWidget(text: "Order Date :", fontSize: 12, fontColor: AppColors.textLightColor),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextWidget(text: "${controller.orderDate}", fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const CustomTextWidget(
                        text: "Delivery Date :",
                        fontSize: 12,
                        fontColor: AppColors.textLightColor,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: CustomTextWidget(text: "${controller.deliveryDate}", fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CustomTextWidget(text: "Payment :", fontSize: 12),
                          const SizedBox(width: 10),
                          CustomTextWidget(text: "${controller.paymentMethod}", fontSize: 12),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Row(
                          children: [
                            const Expanded(
                              child: CustomTextWidget(text: "Total Item :", fontSize: 12, textAlign: TextAlign.end),
                            ),
                            const SizedBox(width: 5),
                            CustomTextWidget(text: controller.totalQuantity.toString(), fontSize: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
