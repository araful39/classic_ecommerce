import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrderStoreWithMultipleOrderService {
  static Future<bool> orderStoreService({required Map data, required String trxID, required String payMode}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await EasyLoading.showSuccess("Order Successful");
      await Future.delayed(Duration(seconds: 1));

      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
