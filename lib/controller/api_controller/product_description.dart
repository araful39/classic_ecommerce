import 'dart:convert';

import 'package:classic_ecommerce/database/product_details.dart';
import 'package:classic_ecommerce/model/product_description_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductDescriptionService {
  static Future<ProductDescriptionModel?> productDescriptionService({required String id}) async {
    try {
      ProductDescriptionModel descriptionModel = ProductDescriptionModel.fromJson(jsonDecode(jsonEncode(ProductDetailsData.details)));
      return descriptionModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
