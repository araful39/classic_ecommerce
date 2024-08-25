
import 'package:classic_ecommerce/controller/api_controller/orders/ongoing_order_details.dart';
import 'package:classic_ecommerce/controller/api_controller/orders/ongoing_order_list.dart';
import 'package:classic_ecommerce/model/ongoing_order_details.dart';
import 'package:classic_ecommerce/model/ongoing_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OngoingOrdersController extends GetxController {
  RxBool isOngoingLoading = true.obs;
  RxBool isOngoingDetailsLoading = true.obs;
  RxList<OngoingList> ongoingOrderList = <OngoingList>[].obs;
  Rx<OngoingView> ongoingView = OngoingView(
    id: 0,
    shippingName: '',
    shippingEmail: '',
    shippingPhone: '',
    shippingAddress: '',
    productData: [],
    totalAmount: "0.0",
    deliveryCharge: "",
    status: '',
  ).obs;

  List trackingList = [
    Icons.check_circle_rounded,
    Icons.directions_bike_outlined,
    Icons.hub_outlined,
    Icons.local_shipping_outlined,
    Icons.backpack_outlined,
  ];

  List trackingData = [
    "Thank you.",
    "Our delivery man is out to deliver your product. Hope to get it soon.",
    "Your product has been received at our hub. You will receive your product within two/three working days.",
    "Your product has been delivered to the car, please wait, hope it arrives soon.",
    "Your product has been packed. We will arrange to ship the product as soon as possible.",
  ];
  List trackingDataHead = [
    "Delivery successful",
    "Out for Delivery",
    "Received to HUB",
    "On th Way",
    "Packed & Ready to Ship",
  ];

  getOnGoingOrderData() async {
    isOngoingLoading.value = true;
    ongoingOrderList.value = await OngoingOrderListService.ongoingOrderListService();
    isOngoingLoading.value = false;
  }

  getOnGoingOrderDetailsData({required int id}) async {
    isOngoingDetailsLoading.value = true;
    ongoingView.value = (await OngoingOrderDetailsService.ongoingOrderDetailsService(id: id)) ??
        OngoingView(
          id: 0,
          shippingName: '',
          shippingEmail: '',
          shippingPhone: '',
          shippingAddress: '',
          productData: [],
          totalAmount: "0.0",
          deliveryCharge: "",
          status: '',
        );
    isOngoingDetailsLoading.value = false;
  }

  @override
  void onInit() {
    getOnGoingOrderData();
    super.onInit();
  }
}
