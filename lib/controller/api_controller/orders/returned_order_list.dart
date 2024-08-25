import 'dart:convert';
import 'package:classic_ecommerce/database/order/return_list.dart';
import 'package:classic_ecommerce/model/return_order_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ReturnedOrderListService {
  static Future<List<ReturnList>> returnedOrderListService() async {
    try {
      ReturnOrderListModel model = ReturnOrderListModel.fromJson(jsonDecode(jsonEncode(ReturnListData.data)));
      return model.returnList ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
