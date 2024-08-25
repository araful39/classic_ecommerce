import 'dart:developer';
import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:classic_ecommerce/view/screen/authentication/sign_in.dart';
import 'package:classic_ecommerce/view/screen/cart/cart.dart';
import 'package:classic_ecommerce/view/screen/category/category.dart';
import 'package:classic_ecommerce/view/screen/home/home.dart';
import 'package:classic_ecommerce/view/screen/my_orders/orders/my_orders.dart';
import 'package:classic_ecommerce/view/screen/profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  RxBool isAlreadyLogin = false.obs;
  RxInt page = 2.obs;

  List<Widget> screensList = [
    const Category(),
    const Cart(),
    const Home(),
    const MyOrders(),
    const Profile(),
  ];

  @override
  void onInit() {
    checkProfileUserAlreadyLogin();
    super.onInit();
  }

  checkProfileUserAlreadyLogin() async {
    var a = await LocalData().readData(key: "userInfo");
    log("Bottom USer Already Login : $a");
    if (a != "") {
      isAlreadyLogin.value = true;
      screensList = [
        const Category(),
        const Cart(),
        const Home(),
        const MyOrders(),
        const Profile(),
      ];
    } else {
      screensList = [
        const Category(),
        const SignIn(),
        const Home(),
        const SignIn(),
        const SignIn(),
      ];
    }
  }
}
