import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:classic_ecommerce/controller/ui_controller/product_description.dart';
import 'package:classic_ecommerce/model/all_product_list.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_rating.dart';
import 'package:classic_ecommerce/view/common_widget/custom_rich_text.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/authentication/sign_in.dart';
import 'package:classic_ecommerce/view/screen/product_description/widget/discount_price_text.dart';
import 'package:classic_ecommerce/view/screen/product_description/widget/slider_image_section.dart';
import 'package:classic_ecommerce/view/screen/shipping_&_checkout/shipping/shipping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/expansion_tile.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productData});

  final Products productData;

  @override
  Widget build(BuildContext context) {
    DescriptionController descriptionController = Get.put(DescriptionController());
    descriptionController.productAmount.value = double.parse(productData.regPrice.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("description".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderImageSection(descriptionController: descriptionController),
            buildSizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: productData.nameEn.toString(),
                    maxLine: 10,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      CustomRating(ratingStar: int.parse(productData.rating.toString())),
                      buildSizedBox(weight: 20),
                      CustomTextWidget(
                        text: "( ${productData.rating} Review )",
                        maxLine: 10,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      const Spacer(),
                      CustomRichText(
                        titleText: "Stock :  ",
                        bodyText: productData.stock.toString(),
                        titleStyle: const TextStyle(color: AppColors.bg1LightColor),
                      )
                    ],
                  ),
                  buildSizedBox(height: 5),
                  DiscountPrice(
                      regularPriceFontSize: 15,
                      salePriceFontSize: 20,
                      regularPrice: double.parse(productData.regPrice.toString()),
                      discountPrice: double.parse(productData.disPrice.toString()),
                      discountType: productData.disType.toString()),
                  buildSizedBox(height: 10),
                  Row(
                    children: [
                      const CustomTextWidget(
                        text: "Total Price: ",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      buildSizedBox(weight: 10),
                      Obx(
                        () => CustomTextWidget(
                          text: "${descriptionController.productAmount.value} ৳",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  buildSizedBox(height: 5),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (descriptionController.productQty.value > 1) {
                            descriptionController.productQty.value--;
                            descriptionController.productAmount.value =
                                double.parse(descriptionController.productQty.value.toString()) * double.parse(productData.regPrice.toString());
                          }
                        },
                        child: Card(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                          child: Padding(
                            padding: buildEdgeInsets(h: 10, v: 5),
                            child: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade100,
                          ),
                          padding: buildEdgeInsets(h: 10, v: 6),
                          margin: buildEdgeInsets(h: 5, v: 6),
                          child: Text(descriptionController.productQty.value.toString()),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          descriptionController.productQty.value++;
                          descriptionController.productAmount.value =
                              double.parse(descriptionController.productQty.value.toString()) * double.parse(productData.regPrice.toString());
                        },
                        child: Card(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                          child: Padding(
                            padding: buildEdgeInsets(h: 10, v: 5),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSizedBox(height: 10),
                  Obx(
                    () => CustomExpansionTile(description: descriptionController.detailsData['description'] ?? "", title: 'product_description'.tr),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Add to cart and Buy Now Button
      bottomNavigationBar: productData.stock == "0"
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var a = await LocalData().readData(key: "userInfo");
                          if (a == "") {
                            Get.to(() => const SignIn());
                          } else {
                            descriptionController.addToCartProduct(
                                productID: int.parse("${productData.productId ?? 0}"), qty: descriptionController.productQty.value);
                          }
                        },
                        child: Card(
                          color: AppColors.appbarLightColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Center(
                              child: CustomTextWidget(
                                text: "add_to_cart".tr,
                                fontColor: AppColors.primaryLightColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const Expanded(child: SizedBox()),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var a = await LocalData().readData(key: "userInfo");
                          if (a == "") {
                            Get.to(() => const SignIn());
                          } else {
                            Get.to(
                              const Shipping(),
                              arguments: {
                                "total_product_price": descriptionController.productAmount,
                                "product_data": {
                                  "product_id": [productData.productId],
                                  "quantity": [descriptionController.productQty.value],
                                  "price": [descriptionController.productAmount.value]
                                }
                              },
                              popGesture: true,
                              opaque: false,
                              fullscreenDialog: false,
                              preventDuplicates: false,
                              curve: Curves.easeIn,
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 600),
                            );
                          }
                        },
                        child: Card(
                          color: AppColors.bg1LightColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Center(
                              child: CustomTextWidget(
                                text: "buy_now".tr,
                                fontColor: AppColors.primaryLightColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
