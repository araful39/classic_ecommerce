import 'dart:convert';
import 'package:classic_ecommerce/database/category_list.dart';
import 'package:classic_ecommerce/model/category_list_for_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryListForFilterService {
  static Future<List<MainCategory>> categoryService() async {
    try {
      CategoryListForFilterModel categoryModel = CategoryListForFilterModel.fromJson(jsonDecode(jsonEncode(CategoryList.categoryNameList)));
      return categoryModel.mainCategory ?? [];
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return [];
  }
}
