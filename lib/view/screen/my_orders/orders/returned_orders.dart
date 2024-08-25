import 'dart:developer';
import 'package:classic_ecommerce/controller/ui_controller/my_order/returned_orders.dart';
import 'package:classic_ecommerce/view/common_widget/custom_order_shimmer_loading.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/returned_order_details.dart';
import 'package:classic_ecommerce/view/screen/my_orders/orders/widget/returned_order_list_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReturnedOrders extends StatelessWidget {
  const ReturnedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    ReturnedOrdersController ordersController = Get.put(ReturnedOrdersController());
    return Obx(
      () => ordersController.isReturnedLoading.value
          ? const CustomOrderShimmer()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ordersController.returnedOrderList.length,
                    itemBuilder: (context, index) {
                      return ReturnedOrderListTileWidget(
                        onDetailsTap: () {
                          log("Details");
                          Get.to(
                            () => ReturnedOrderDetails(
                              controller: ordersController, id: ordersController.returnedOrderList[index].id.toString(),
                            ),
                          );
                        },
                        controller: ordersController.returnedOrderList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
