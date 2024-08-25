import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ChangePasswordService {
  static Future<bool> changePasswordService({required String currentPass, required String newPassword, required String confPassword}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await EasyLoading.showSuccess("Changed");
      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
