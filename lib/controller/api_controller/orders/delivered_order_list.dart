import 'dart:convert';
import 'package:classic_ecommerce/database/order/delivery_list.dart';
import 'package:classic_ecommerce/model/delivered_order_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DeliveredOrderListService {
  static Future<List<DeliveryList>> deliveredOrderListService() async {
    try {
      DeliveredOrderListModel model = DeliveredOrderListModel.fromJson(jsonDecode(jsonEncode(DeliveryListData.data)));
      return model.deliveryList ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
