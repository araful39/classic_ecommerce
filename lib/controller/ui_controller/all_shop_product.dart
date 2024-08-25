import 'dart:developer';
import 'package:classic_ecommerce/controller/api_controller/all_product.dart';
import 'package:classic_ecommerce/controller/api_controller/category_list_for_filter.dart';
import 'package:classic_ecommerce/controller/api_controller/category_wise_product.dart';
import 'package:classic_ecommerce/controller/api_controller/filtered_all_product.dart';
import 'package:classic_ecommerce/model/all_product_list.dart';
import 'package:classic_ecommerce/model/category_list_for_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllShopProductController extends GetxController {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController minimumPriceController = TextEditingController();
  final TextEditingController maximumPriceController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  RxBool searchClosed = true.obs;
  RxBool isLoading = true.obs;
  RxList<Products> productList = <Products>[].obs;
  RxInt tapCount = 0.obs;
  RxList<MainCategory> categoryListData = <MainCategory>[].obs;
  RxString categoryName = "".obs;
  RxString ratingFilterIndex = "".obs;

  @override
  void onInit() {
    getProductList();
    getCategoryList();
    super.onInit();
  }

  getCategoryList() async {
    var data = await CategoryListForFilterService.categoryService();
    MainCategory categoryData = MainCategory(categoryName: "All", categoryId: 0);
    categoryListData.add(categoryData);
    for (var i in data) {
      log("${i.categoryId}");
      categoryListData.add(i);
    }
    categoryName.value = categoryListData.first.categoryId.toString();
  }

  getProductList() async {
    Map<String, String> data = await Get.arguments ?? {};
    isLoading.value = true;
    if (data.isEmpty) {
      var myData = await AllProductListService.allProductListService();
      productList.clear();
      productList.value = myData;
    } else {
      var myData = await CategoryWiseProductListService.categoryWiseProductListService(id: data['id'].toString());
      productList.value = myData;
    }
    isLoading.value = false;
  }

  getFilteredProductList() async {
    isLoading.value = true;
    var myData = await FilteredAllProductListService.allProductListService(
        categoryId: categoryName.value,
        rating: ratingFilterIndex.value,
        minPrice: minimumPriceController.text,
        maxPrice: maximumPriceController.text,
        searchText: searchController.text);
    isLoading.value = false;
    productList.clear();
    productList.value = myData;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
