import 'dart:convert';
import 'package:classic_ecommerce/database/order/ongoing_order_list_data.dart';
import 'package:classic_ecommerce/model/ongoing_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OngoingOrderListService {
  static Future<List<OngoingList>> ongoingOrderListService() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      OngoingOrderListModel model = OngoingOrderListModel.fromJson(jsonDecode(jsonEncode(OngoingOrderListData.data)));
      return model.ongoingList ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
