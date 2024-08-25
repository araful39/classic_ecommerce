import 'package:classic_ecommerce/controller/ui_controller/my_order/delivered_orders.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/widget/loading_shimmer_order_details_screen.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/widget/product_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveredOrderDetails extends StatelessWidget {
  const DeliveredOrderDetails({super.key, required this.controller, required this.id});
  final DeliveredOrdersController controller;
  final String id;

  @override
  Widget build(BuildContext context) {
    controller.getDeliveredOrderDetailsData(id: id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isDeliveredDetailsLoading.isTrue
              ? const LoadingOrderDetailsScreen()
              : Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: "# ${controller.deliveredOrderView.value.orderNo}",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              const CustomTextWidget(text: "Delivered", fontSize: 16, fontColor: Colors.green),
                            ],
                          ),
                          Row(
                            children: [
                              const CustomTextWidget(text: "Order Date : ", fontSize: 15),
                              Expanded(
                                child: CustomTextWidget(text: "${controller.deliveredOrderView.value.orderDate}", fontSize: 15),
                              )
                            ],
                          ),

                          const SizedBox(height: 20),
                          const CustomTextWidget(text: "Delivered to", fontSize: 16),
                            CustomTextWidget(
                            text: "${controller.deliveredOrderView.value.shippingAddress}",
                            fontSize: 16,
                            maxLine: 2,
                            fontFamily: "Normal",
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 20),
                          const CustomTextWidget(text: "Payment Methode", fontSize: 16),
                          CustomTextWidget(
                            text: "${controller.deliveredOrderView.value.paymentMethod}",
                            fontSize: 16,
                            maxLine: 2,
                            fontFamily: "Normal",
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomTextWidget(text: "Product Price", fontSize: 18),
                              CustomTextWidget(
                                  text: double.parse(controller.deliveredOrderView.value.totalAmount ?? "0").toStringAsFixed(2), fontSize: 16),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomTextWidget(text: "Delivery Charge", fontSize: 18),
                              CustomTextWidget(
                                  text: double.parse(controller.deliveredOrderView.value.deliveryCharge ?? "0").toStringAsFixed(2), fontSize: 16),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(text: "Discount Price", fontSize: 18),
                              CustomTextWidget(text: "00.00", fontSize: 16),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomTextWidget(text: "Total Paid Amount", fontSize: 18, fontWeight: FontWeight.w600),
                              CustomTextWidget(
                                  text: (double.parse(controller.deliveredOrderView.value.totalAmount ?? "0") +
                                          double.parse(controller.deliveredOrderView.value.deliveryCharge ?? "0"))
                                      .toStringAsFixed(2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(height: 20),
                          const CustomTextWidget(text: "Ordered Products", fontSize: 18, fontWeight: FontWeight.w600),
                          const SizedBox(height: 5),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.deliveredOrderView.value.productData?.length,
                            itemBuilder: (context, index) {
                              var data = controller.deliveredOrderView.value.productData?[index];
                              return DeliveredItemListTileCard(
                                productImage: "${data?.image.toString()}",
                                productName: "${data?.productName.toString()}",
                                productUnitPrice: "${data?.price.toString()}",
                                productQty: "${data?.quantity.toString()}",
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
