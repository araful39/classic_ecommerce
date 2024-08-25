import 'dart:convert';
import 'package:classic_ecommerce/database/product_list.dart';
import 'package:classic_ecommerce/model/all_product_list.dart';
import 'package:flutter/material.dart';

class FilteredAllProductListService {
  static Future<List<Products>> allProductListService(
      {required String categoryId, required String rating, required String minPrice, required String maxPrice, required String searchText}) async {
    try {
      AllProductListModel productList = AllProductListModel.fromJson(jsonDecode(jsonEncode(ProductList.productList)));
      return productList.products?.reversed.toList() ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    return [];
  }
}
