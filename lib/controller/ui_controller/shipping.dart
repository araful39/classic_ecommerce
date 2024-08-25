import 'dart:convert';
import 'dart:developer';
import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShippingController extends GetxController {
  final shippingFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  Map<String, dynamic> argumentsData = {};

  @override
  void onInit() {
    getArgumentsData();
    getProfileInfo();
    super.onInit();
  }

  getArgumentsData() async {
    argumentsData = await Get.arguments ?? {};
    log("message  : $argumentsData");
  }

  getProfileInfo() async {
    var a = await LocalData().readData(key: "userInfo");
    log("---Profile - User Info : $a");
    if (a != "") {
      var userInfo = jsonDecode(a);
      nameController.text = userInfo['name'] ?? "";
      mailController.text = userInfo['email'] ?? "";
      phoneController.text = userInfo['phone'] ?? "";
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Map<String, dynamic> shippingInfoData() {
    var data = {
      "customer_name": nameController.text,
      "customer_email": mailController.text,
      "customer_phone": phoneController.text,
      "street": houseController.text,
      "city": cityController.text,
      "zip_code": postalCodeController.text,
      "district": districtController.text,
      "division": divisionController.text,
      "product_data": argumentsData['product_data'],
      "delivery_charge": 49,
      "total_amount": argumentsData['total_product_price'].toString()
    };
    log("$data");
    return data;
  }
}
