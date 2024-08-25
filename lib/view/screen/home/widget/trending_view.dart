import 'package:classic_ecommerce/controller/ui_controller/home.dart';
import 'package:classic_ecommerce/view/common_widget/custom_refresh_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_shimmer.dart';
import 'package:classic_ecommerce/view/screen/product_description/product_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'trending_product_card.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 200,
        child: homeController.trendingViewLoading.isTrue
            ? ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) {
                  return SizedBox(
                    height: 180,
                    width: 150,
                    child: CustomShimmer(
                      height: 80,
                      margin: 5,
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade200,
                      containerColor: Colors.white,
                    ),
                  );
                },
              )
            : homeController.trendingProductList.isEmpty
                ? CustomRefreshButton(
                    containerColor: Colors.grey.shade100,
                    refreshButton: () {
                      homeController.getTrendingProducts();
                    })
                : ListView.builder(
                    controller: homeController.trendingScrollController,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: homeController.trendingProductList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return SizedBox(
                        height: 200,
                        width: 150,
                        child: TrendingProductCardImage(
                          networkImage: "${homeController.trendingProductList[i].image}",
                          height: 200,
                          width: 150,
                          discountType: int.parse(homeController.trendingProductList[i].disType.toString()),
                          discountPrice: double.parse(homeController.trendingProductList[i].disPrice.toString()),
                          regularPrice: double.parse(homeController.trendingProductList[i].regPrice.toString()),
                          rating: int.parse(homeController.trendingProductList[i].rating.toString()),
                          productName: homeController.trendingProductList[i].nameEn ?? "",
                          onTap: () {
                            Get.to(ProductDescription(productData: homeController.trendingProductList[i]),
                                arguments: homeController.trendingProductList[i].productId.toString());
                          },
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
