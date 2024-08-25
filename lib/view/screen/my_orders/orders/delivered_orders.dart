import 'dart:developer';
import 'package:classic_ecommerce/controller/ui_controller/my_order/delivered_orders.dart';
import 'package:classic_ecommerce/view/common_widget/custom_order_shimmer_loading.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/delivered_order_details.dart';
import 'package:classic_ecommerce/view/screen/my_orders/orders/widget/delivered_order_list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeliveredOrders extends StatelessWidget {
  const DeliveredOrders({super.key});

  @override
  Widget build(BuildContext context) {
    DeliveredOrdersController ordersController = Get.put(DeliveredOrdersController());
    return Obx(
      () => ordersController.isDeliveredLoading.value
          ? const CustomOrderShimmer()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ordersController.deliveredOrderList.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => DeliveredOrderListTileWidget(
                          onDetailsTap: () {
                            log("Details");
                            Get.to(
                              () => DeliveredOrderDetails(
                                controller: ordersController,
                                id: ordersController.deliveredOrderList[index].id.toString(),
                              ),
                            );
                          },
                          image: ordersController.deliveredOrderList[index].image.toString(),
                          controller: ordersController.deliveredOrderList[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
