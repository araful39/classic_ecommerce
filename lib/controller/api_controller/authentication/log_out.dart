
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LogOutService {
  static Future<bool> logOutService() async {
    try {
      await EasyLoading.showSuccess("Log Out Successful");
      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
