import 'dart:developer';

import 'package:classic_ecommerce/controller/api_controller/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Login Controller
class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordEnable = true.obs;
  RxBool isLoading = false.obs;

  Future<bool> signInService() async {
    bool a = await LoginService.loginService(email: emailController.text, password: passwordController.text);
    return a;
  }

  @override
  void onInit() {
    emailController.text = "classic@gmail.com";
    passwordController.text = "12345678";
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    log("------------------");
    super.dispose();
  }
}
