import 'dart:convert';
import 'package:classic_ecommerce/database/add_to_cart.dart';
import 'package:classic_ecommerce/model/cart_product_model.dart';
import 'package:classic_ecommerce/utils/common_function/common_snackbar_message.dart';
import 'package:flutter/material.dart';

class ViewCartProductListService {
  static Future<List<ProductCart>?> viewCartProductListService() async {
    try {
      ViewCartProductListModel data = ViewCartProductListModel.fromJson(
          jsonDecode(jsonEncode(AddToCartData.addToCartData)));
      return data.productCart;
    } catch (e) {
      debugPrint("Error : $e");
    }
    CommonSnackBarMessage.errorMessage(text: "Something went wrong..!!");
    return [];
  }
}
