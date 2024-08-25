import 'dart:developer';
import 'package:classic_ecommerce/controller/api_controller/orders/delivered_order_details.dart';
import 'package:classic_ecommerce/controller/api_controller/orders/delivered_order_list.dart';
import 'package:classic_ecommerce/model/delivered_order_details_model.dart';
import 'package:classic_ecommerce/model/delivered_order_list_model.dart';
import 'package:get/get.dart';

class DeliveredOrdersController extends GetxController {
  RxBool isDeliveredLoading = true.obs;
  RxBool isDeliveredDetailsLoading = true.obs;
  RxList<DeliveryList> deliveredOrderList = <DeliveryList>[].obs;
  Rx<DeliveryView> deliveredOrderView = DeliveryView(
    shippingName: '',
    shippingEmail: '',
    shippingPhone: '',
    productData: [],
    totalAmount: "0.0",
    orderDate: "",
    orderNo: "",
    paymentMethod: "",
    userName: "",
    status: '',
  ).obs;

  getDeliveredOrderData() async {
    isDeliveredLoading.value = true;
    deliveredOrderList.value = await DeliveredOrderListService.deliveredOrderListService();
    log("${deliveredOrderList.length}");
    isDeliveredLoading.value = false;
  }

  getDeliveredOrderDetailsData({required String id}) async {
    isDeliveredDetailsLoading.value = true;
    deliveredOrderView.value = await DeliveredOrderDetailsService.deliveredOrderDetailsService(id: int.parse(id)) ?? deliveredOrderView.value;
    log("${deliveredOrderView.value.orderNo}");
    isDeliveredDetailsLoading.value = false;
  }

  @override
  void onInit() {
    getDeliveredOrderData();
    super.onInit();
  }
}
