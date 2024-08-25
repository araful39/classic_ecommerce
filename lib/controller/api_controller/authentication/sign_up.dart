import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUpService {
  static Future<bool> signUpService({required String email, required String phone, required String password, required String conPassword}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await EasyLoading.showSuccess("Success");
      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
