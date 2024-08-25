import 'dart:convert';
import 'package:classic_ecommerce/database/order/delivered_details.dart';
import 'package:classic_ecommerce/model/delivered_order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DeliveredOrderDetailsService {
  static Future<DeliveryView?> deliveredOrderDetailsService({required int id}) async {
    try {
      DeliveredOrderDetailsModel view = DeliveredOrderDetailsModel.fromJson(jsonDecode(jsonEncode(DeliveredDetailsData.data)));
      return view.deliveryView;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
