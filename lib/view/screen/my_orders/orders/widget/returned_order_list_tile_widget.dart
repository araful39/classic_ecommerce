import 'package:classic_ecommerce/model/return_order_list_model.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_rich_text.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class ReturnedOrderListTileWidget extends StatelessWidget {
  const ReturnedOrderListTileWidget({
    super.key,
    required this.onDetailsTap,
    required this.controller,
  });
  final VoidCallback onDetailsTap;
  final ReturnList controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetailsTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          // color: AppColors.whiteCardColor,
          border: Border.all(color: Colors.grey.withOpacity(.1), width: 2, strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: "# ${controller.orderNo}",
                          fontColor: AppColors.bg1LightColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomTextWidget(
                        text:
                            (double.parse(controller.totalPrice.toString()) + double.parse(controller.deliveryCharge.toString())).toStringAsFixed(2),
                        fontColor: AppColors.bg1LightColor,
                        fontSize: 18,
                        fontFamily: "normal",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomRichText(
                          textOverflow: TextOverflow.ellipsis,
                          maxLine: 3,
                          titleText: "Reason : ",
                          bodyText: "${controller.returnReason}",
                          titleStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.textLightColor.withOpacity(.5),
                          ),
                          bodyStyle: TextStyle(fontSize: 14, color: AppColors.textLightColor.withOpacity(.5), overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
