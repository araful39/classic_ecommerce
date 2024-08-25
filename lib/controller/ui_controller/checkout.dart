 import 'package:classic_ecommerce/controller/api_controller/order_store_with_multiple_product.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxMap<String, dynamic> data = <String, dynamic>{}.obs;
  RxDouble payableAmount = 0.0.obs;
  RxDouble deliveryCharge = 0.0.obs;
  RxString selectMethode = "".obs;
  @override
  void onInit() {
    getArgumentsData();
    super.onInit();
  }

  getArgumentsData() async {
    data.value = await Get.arguments ?? {};
    deliveryCharge.value = double.parse((data['delivery_charge'] ?? 0).toString());
    payableAmount.value = double.parse(data['total_amount'] ?? "0") + deliveryCharge.value;
  }

  Future<bool> orderStoreServices({String? tranID}) async {
    bool status = await OrderStoreWithMultipleOrderService.orderStoreService(data: data, trxID: tranID ?? '', payMode: selectMethode.value);
    if(status){
      await EasyLoading.dismiss();
    }
    return status;
  }
}
