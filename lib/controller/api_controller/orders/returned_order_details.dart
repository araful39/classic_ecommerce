import 'dart:convert';
import 'package:classic_ecommerce/database/order/return_details.dart';
import 'package:classic_ecommerce/model/return_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ReturnedOrderDetailsService {
  static Future<ReturnView?> returnedOrderDetailsService({required int id}) async {
    try {
      ReturnOrderDetailsModel view = ReturnOrderDetailsModel.fromJson(jsonDecode(jsonEncode(ReturnDetailsData.data)));
      return view.returnView;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
