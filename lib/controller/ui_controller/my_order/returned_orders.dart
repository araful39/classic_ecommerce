import 'package:classic_ecommerce/controller/api_controller/orders/returned_order_details.dart';
import 'package:classic_ecommerce/controller/api_controller/orders/returned_order_list.dart';
import 'package:classic_ecommerce/model/return_order_details.dart';
import 'package:classic_ecommerce/model/return_order_list_model.dart';
import 'package:get/get.dart';

class ReturnedOrdersController extends GetxController {
  RxBool isReturnedLoading = true.obs;
  RxBool isReturnedDetailsLoading = true.obs;
  RxList<ReturnList> returnedOrderList = <ReturnList>[].obs;
  Rx<ReturnView> returnOrderView = ReturnView(
    userName: "",
    paymentMethod: "",
    orderNo: "",
    orderDate: "",
    returnDate: "",
    returnReason: "",
    shippingName: "",
    shippingEmail: "",
    shippingPhone: "",
    shippingAddress: "",
    productData: [],
    totalAmount: "0.0",
    deliveryCharge: "",
    status: "",
  ).obs;

  getReturnedOrderData() async {
    isReturnedLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    returnedOrderList.value = await ReturnedOrderListService.returnedOrderListService();
    isReturnedLoading.value = false;
  }

  getReturnedOrderDetailsData({required String id}) async {
    isReturnedDetailsLoading.value = true;
    returnOrderView.value = await ReturnedOrderDetailsService.returnedOrderDetailsService(id: int.parse(id)) ?? returnOrderView.value;
    isReturnedDetailsLoading.value = false;
  }

  @override
  void onInit() {
    getReturnedOrderData();
    super.onInit();
  }
}
