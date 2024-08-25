import 'dart:developer';
import 'package:classic_ecommerce/controller/ui_controller/cart.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_banner_image.dart';
import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_order_shimmer_loading.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/cart/widget/increment_decrement.dart';
import 'package:classic_ecommerce/view/screen/cart/widget/no_cart_data_found.dart';
import 'package:classic_ecommerce/view/screen/shipping_&_checkout/shipping/shipping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    Size size = MediaQuery.sizeOf(context);
    cartController.getCartProductList();
    return Scaffold(
      appBar: AppBar(title: Text("shopping_cart".tr)),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Obx(
            () => cartController.isLoading.isTrue
                ? const CustomOrderShimmer()
                : cartController.cartProductList.isEmpty
                    ? const NoCartProductFoundWidget()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CustomTextWidget(
                                    text: "Total Item".tr,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: CustomTextWidget(
                                        text: ":  ${cartController.cartProductList.length}",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: size.height / 1.8,
                            child: Obx(
                              () => ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  shrinkWrap: true,
                                  itemCount: cartController.cartProductList.length,
                                  itemBuilder: (_, index) {
                                    var data = cartController.cartProductList[index];
                                    double salePrice = 0.0;
                                    if (data.discountPrice != 0) {
                                      if (data.discountType == 0) {
                                        salePrice = (data.salePrice! - double.parse(data.discountPrice.toString()));
                                      } else if (data.discountType == 1) {
                                        salePrice = (data.salePrice! - (double.parse(data.discountPrice.toString()) / 100) * data.salePrice!);
                                      } else {
                                        salePrice = 0.00;
                                      }
                                    } else {
                                      salePrice = double.parse(data.salePrice.toString());
                                    }
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      cartController.priceList[index] = salePrice * data.quantity!;
                                      cartController.totalPrice.value = 0.00;
                                      for (int i = 0; i < cartController.priceList.length; i++) {
                                        cartController.totalPrice.value += cartController.priceList[i];
                                      }
                                    });
                                    return Card(
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      surfaceTintColor: Colors.transparent,
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.3), strokeAlign: BorderSide.strokeAlignOutside),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: CustomBannerImage(
                                              networkImage: "${cartController.cartProductList[index].productImage}",
                                              height: size.height / 7,
                                              width: size.width / 5,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomTextWidget(
                                                      text: "${cartController.cartProductList[index].productName?.en}", fontSize: 15, maxLine: 2),
                                                  Row(
                                                    children: [
                                                      const CustomTextWidget(
                                                        text: "Unit Price : ",
                                                        fontSize: 12,
                                                      ),
                                                      CustomTextWidget(
                                                        text: "$salePrice ৳",
                                                        fontSize: 12,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Obx(()=> CustomTextWidget(
                                                        text: "${cartController.qty.value * salePrice} ৳",
                                                        fontSize: 16,
                                                        fontColor: Colors.red,
                                                      ),),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () async {
                                                          cartController.cartProductList.removeAt(index);
                                                        },
                                                        child: const Icon(Icons.delete_forever, color: Colors.red),
                                                      ),
                                                      const SizedBox(width: 10)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                IncrementDecrementButton(
                                                    iconData: Icons.add,
                                                    onTap: () async {
                                                      cartController.qty.value ++;
                                                    }),
                                                Obx(
                                                  () => CustomTextWidget(
                                                    text: "${cartController.qty.value}",
                                                    fontSize: 15,
                                                    fontColor: Colors.black,
                                                  ),
                                                ),
                                                IncrementDecrementButton(
                                                    iconData: Icons.remove,
                                                    onTap: () async {
                                                      if (cartController.qty.value > 1) {
                                                        cartController.qty.value --;
                                                      } else {
                                                        await EasyLoading.showError("Minimum quantity should be 1");
                                                      }
                                                    }),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => cartController.cartProductList.isEmpty
            ? const SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    color: const Color(0xffFFEDE5),
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                            text: "total_amount".tr,
                            fontSize: 18,
                            fontColor: AppColors.bg2LightColor,
                          ),
                          Obx(
                            () => CustomTextWidget(
                              text: "= ${cartController.totalPrice.obs} ৳",
                              fontSize: 18,
                              fontColor: AppColors.bg1LightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    text: "checkout".tr,
                    onTap: () async {
                      Map<String, dynamic> data = await cartController.orderService();
                      log("$data");
                      Get.to(() => const Shipping(), arguments: data);
                    },
                  ),
                  const SizedBox(height: 70)
                ],
              ),
      ),
    );
  }
}
