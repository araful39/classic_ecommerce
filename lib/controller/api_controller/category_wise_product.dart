import 'dart:convert';

import 'package:classic_ecommerce/database/product_list.dart';
import 'package:classic_ecommerce/model/all_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryWiseProductListService {
  static Future<List<Products>> categoryWiseProductListService({required String id}) async {
    try {
      AllProductListModel productList = AllProductListModel.fromJson(jsonDecode(jsonEncode(ProductList.productList)));
      return productList.products ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
