import 'package:classic_ecommerce/controller/ui_controller/my_order/ongoing_orders.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/widget/loading_shimmer_order_details_screen.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/widget/order_tracking_heading_text.dart';
import 'package:classic_ecommerce/view/screen/my_orders/order_details/widget/product_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ConfirmedOrderTracking extends StatelessWidget {
  const ConfirmedOrderTracking({super.key, required this.orderID, required this.controller});
  final int orderID;
  final OngoingOrdersController controller;
  @override
  Widget build(BuildContext context) {
    controller.getOnGoingOrderDetailsData(id: orderID);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Tracking"),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.ongoingView.value.productData?.isEmpty ?? true
              ? const LoadingOrderDetailsScreen()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      width: size.width,
                      decoration: BoxDecoration(color: AppColors.bg1LightColor, borderRadius: BorderRadius.circular(1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Receiver",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontColor: Theme.of(context).textTheme.titleLarge?.color,
                          ),
                          CustomTextWidget(
                            text: controller.ongoingView.value.shippingName ?? "",
                            fontSize: 17,
                            fontColor: Theme.of(context).textTheme.titleLarge?.color?.withOpacity(.9),
                          ),
                          CustomTextWidget(
                            text: controller.ongoingView.value.shippingPhone ?? "",
                            fontSize: 14,
                            fontColor: Theme.of(context).textTheme.titleLarge?.color?.withOpacity(.9),
                          ),
                          CustomTextWidget(
                            text: controller.ongoingView.value.shippingEmail ?? "",
                            fontSize: 14,
                            fontColor: Theme.of(context).textTheme.titleLarge?.color?.withOpacity(.9),
                          ),
                          CustomTextWidget(
                            text: controller.ongoingView.value.shippingAddress ?? "",
                            maxLine: 3,
                            fontSize: 14,
                            fontColor: Theme.of(context).textTheme.titleLarge?.color?.withOpacity(.9),
                          ),
                          const SizedBox(height: 20),
                          const OrderTrackingHeadingTextWidget(title: "Payment Methode", text: "COD"),
                          const OrderTrackingHeadingTextWidget(title: "Total Ordered Amount", text: "25630.00 ৳"),
                          const OrderTrackingHeadingTextWidget(title: "Due Amount ", text: "2563.00 ৳"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.trackingList.length,
                              itemBuilder: (_, index) {
                                return TimelineTile(
                                  beforeLineStyle: const LineStyle(color: Colors.blue, thickness: 2),
                                  afterLineStyle: const LineStyle(color: Colors.blue, thickness: 2),
                                  endChild: Container(
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          text: controller.trackingDataHead[index],
                                          maxLine: 1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          fontColor: index == 0 ? Colors.blue : Theme.of(context).textTheme.titleMedium?.color,
                                        ),
                                        CustomTextWidget(
                                          text: controller.trackingData[index],
                                          maxLine: 6,
                                          fontWeight: FontWeight.w400,
                                          fontColor: Theme.of(context).textTheme.titleMedium?.color?.withOpacity(.8),
                                        )
                                      ],
                                    ),
                                  ),
                                  hasIndicator: true,
                                  isFirst: index == 0 ? true : false,
                                  isLast: index == 4 ? true : false,
                                  alignment: TimelineAlign.manual,
                                  lineXY: .14,
                                  startChild: const CustomTextWidget(
                                    text: "Mar 24 4:17",
                                    maxLine: 3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    color: Colors.blue,
                                    iconStyle: IconStyle(iconData: controller.trackingList[index], color: Colors.white, fontSize: 15),
                                  ),
                                );
                              }),
                          CustomTextWidget(
                            text: "Products",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontColor: Theme.of(context).textTheme.titleMedium?.color,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.ongoingView.value.productData?.length,
                            itemBuilder: (context, index) {
                              var data = controller.ongoingView.value.productData?[index];
                              return DeliveredItemListTileCard(
                                productImage: "${data?.image.toString()}",
                                productName: "${data?.productName.toString()}",
                                productUnitPrice: "${data?.price.toString()}",
                                productQty: "${data?.quantity.toString()}",
                              );
                            },
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
