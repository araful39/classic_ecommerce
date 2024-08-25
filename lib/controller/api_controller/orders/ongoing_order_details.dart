import 'dart:convert';

import 'package:classic_ecommerce/database/order/ongoing_details.dart';
import 'package:classic_ecommerce/model/ongoing_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OngoingOrderDetailsService {
  static Future<OngoingView?> ongoingOrderDetailsService({required int id}) async {
    try {
      OngoingOrderDetailsModel view = OngoingOrderDetailsModel.fromJson(jsonDecode(jsonEncode(OngoingDetailsData.data)));
      return view.ongoingView;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
