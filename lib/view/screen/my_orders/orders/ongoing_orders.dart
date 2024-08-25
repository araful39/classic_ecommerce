import 'package:classic_ecommerce/controller/ui_controller/my_order/ongoing_orders.dart';
import 'package:classic_ecommerce/model/ongoing_order_model.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_order_shimmer_loading.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/ongoing_order_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnGoingOrders extends StatelessWidget {
  const OnGoingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    OngoingOrdersController ordersController = Get.put(OngoingOrdersController());
    return Obx(
      () => ordersController.isOngoingLoading.value
          ? const CustomOrderShimmer()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: ordersController.ongoingOrderList.length,
              itemBuilder: (context, index) {
                OngoingList data = ordersController.ongoingOrderList[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => ConfirmedOrderTracking(
                        orderID: int.parse(data.id.toString()),
                        controller: ordersController,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      // color: AppColors.whiteCardColor,
                      border: Border.all(color: Colors.grey.withOpacity(.1), width: 2, strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomTextWidget(
                                  text: "# ".tr,
                                  fontWeight: FontWeight.w400,
                                  fontColor: AppColors.bg1LightColor,
                                  fontSize: 16,
                                ),
                                SelectableText(
                                  "${ordersController.ongoingOrderList[index].orderNo}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.bg1LightColor,
                                  ),
                                ),
                              ],
                            ),
                            CustomTextWidget(
                                text: (double.parse(data.totalAmount.toString()) + double.parse(data.deliveryCharge.toString())).toStringAsFixed(2),
                                fontColor: AppColors.bg1LightColor,
                                fontSize: 18),
                          ],
                        ),
                        CustomTextWidget(
                          text: "${data.createdAt}",
                          fontColor: Colors.black54,
                        ),
                        Row(
                          children: [
                            CustomTextWidget(
                              text: "Estimated Delivery".tr,
                              fontColor: Colors.black45.withOpacity(.5),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomTextWidget(
                                text: "${data.createdAt?.substring(0, 12)}".tr,
                                fontColor: Colors.black45.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
