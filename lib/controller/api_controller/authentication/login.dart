import 'dart:convert';
import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginService {
  static Future<bool> loginService({required String email, required String password}) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      var data = {
        "id": 4,
        "name": "Md. Mamun Islam",
        "username": null,
        "email": email,
        "phone": "01705021098",
        "address": "Dhaka",
        "Profile_image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ530QmZxSQdjIVUK53CXis8gnzUG5m7Zsupg&s",
        "Date": "14 May 2024"
      };

      await LocalData().writeData(key: "userInfo", value: jsonEncode(data));
      await EasyLoading.showSuccess("Success");
      return true;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return false;
  }
}
