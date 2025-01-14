import 'package:classic_ecommerce/controller/ui_controller/all_shop_product.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_product_card_image.dart';
import 'package:classic_ecommerce/view/common_widget/custom_search_field.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/common_widget/product_loading_shimmer.dart';
import 'package:classic_ecommerce/view/screen/all_product_list/widget_1/filter_widget.dart';
import 'package:classic_ecommerce/view/screen/product_description/product_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget_1/tap_to_reload_widget.dart';

class AllShopProduct extends StatelessWidget {
  const AllShopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    AllShopProductController productController = Get.put(AllShopProductController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        key: productController.refreshIndicatorKey,
        onRefresh: () async => await productController.getProductList(),
        child: CustomScrollView(
          slivers: <Widget>[
            /// Appbar
            SliverAppBar(
              expandedHeight: 140,
              backgroundColor: AppColors.bg1LightColor,
              floating: true,
              automaticallyImplyLeading: false,
              snap: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(top: size.height / 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const CustomTextWidget(
                            text: "All Shop Products",
                            fontSize: 23,
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox()
                        ],
                      ),
                      buildSizedBox(height: 20),
                      Obx(
                        () => CustomSearchField(
                          searchClosed: productController.searchClosed.value,
                          onChange: (String value) {
                            if (value.isNotEmpty || value != "") {
                              productController.getFilteredProductList();
                              productController.searchClosed.value = false;
                            } else {
                              productController.getProductList();
                              productController.searchClosed.value = true;
                            }
                          },
                          onTap: () {
                            productController.searchController.clear();
                            productController.getProductList();
                            productController.searchClosed.value = true;
                          },
                          controller: productController.searchController,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FilterWidget(controller: productController),
                          buildSizedBox(weight: 5),
                          Obx(
                            () => CustomTextWidget(
                              text: "Total item : ${productController.productList.length}",
                              fontSize: 14,
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(padding: buildEdgeInsets(v: 3)),

            // ProductLoadingShimmer()
            Obx(
              () => productController.isLoading.value
                  ? const ProductLoadingShimmer()
                  : productController.productList.isEmpty
                      ? SliverList.list(children: [
                          TapToReloadWidget(
                              refreshTap: () {
                                productController.getProductList();
                                productController.tapCount.value++;
                              },
                              tapCount: productController.tapCount.value)
                        ])
                      : SliverGrid.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .7, crossAxisCount: 2),
                          itemCount: productController.productList.length,
                          itemBuilder: (_, index) {
                            return CustomProductCardImage(
                              productData: productController.productList[index],
                              onTap: () {
                                Get.to(ProductDescription(productData: productController.productList[index]),
                                    curve: Curves.easeIn,
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 100),
                                    arguments: productController.productList[index].productId.toString());
                              },
                              height: 200,
                              width: 100,
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }

  // Custom Padding  EdgeInsets with symmetric
  EdgeInsets buildEdgeInsets({double? h, double? v}) => EdgeInsets.symmetric(horizontal: h ?? 0, vertical: v ?? 0);

  // Custom SizedBox
  SizedBox buildSizedBox({double? height, double? weight}) {
    return SizedBox(
      width: weight ?? 0,
      height: height ?? 0,
    );
  }
}
