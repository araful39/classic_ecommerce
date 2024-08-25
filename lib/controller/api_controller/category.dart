import 'dart:convert';
import 'package:classic_ecommerce/database/category_list.dart';
import 'package:classic_ecommerce/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoryService {
  static Future<CategoriesModel?> categoryService() async {
    try {
      CategoriesModel categoryModel = CategoriesModel.fromJson(jsonDecode(jsonEncode(CategoryList.categoryList)));
      return categoryModel;
    } catch (e) {
      debugPrint("Error : $e");
    }
    await EasyLoading.showError("Something went wrong..!!");
    return null;
  }
}
