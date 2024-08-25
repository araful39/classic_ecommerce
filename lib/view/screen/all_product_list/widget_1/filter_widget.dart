import 'package:classic_ecommerce/controller/ui_controller/all_shop_product.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_dropdown_menu.dart';
import 'package:classic_ecommerce/view/common_widget/custom_loading_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/profile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_rating_filter_checkbox.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.controller});
  final AllShopProductController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Obx(
                () => Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, right: 10, left: 10, top: 20),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                  text: "Filter Section",
                                  fontSize: 22,
                                  fontFamily: "Normal",
                                  fontWeight: FontWeight.w600,
                                  fontColor: AppColors.bg1LightColor,
                                ),
                              ],
                            ),

                            // ========================= Categories  =======================
                            const SizedBox(height: 10),
                            const CustomTextWidget(text: "Categories", fontSize: 20),
                            CustomDropDownWidget(
                              list: controller.categoryListData,
                              initialSelection: controller.categoryName.value,
                              function: (value) {
                                controller.categoryName.value = value!;
                              },
                            ),

                            // ========================= Pricing Section  =======================
                            const SizedBox(height: 5),
                            const CustomTextWidget(text: "Pricing", fontSize: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CustomTextWidget(text: "  Minimum Price", fontSize: 12),
                                      CustomTextField(
                                          controller: controller.minimumPriceController, labelText: "price", textInputType: TextInputType.number),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CustomTextWidget(text: "  Maximum Price", fontSize: 12),
                                      CustomTextField(
                                          controller: controller.maximumPriceController, labelText: "price", textInputType: TextInputType.number),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // ========================= Rating  =======================
                            const SizedBox(height: 5),
                            const CustomTextWidget(text: "Rating", fontSize: 20),
                            CustomRatingFilterCheckBox(controller: controller, index: 5),
                            CustomRatingFilterCheckBox(controller: controller, index: 4),
                            CustomRatingFilterCheckBox(controller: controller, index: 3),
                            CustomRatingFilterCheckBox(controller: controller, index: 2),
                            CustomRatingFilterCheckBox(controller: controller, index: 1),

                            // ========================= Filter Button  =======================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(
                                  () => controller.isLoading.isTrue
                                      ? const CustomLoadingButton(buttonWidth: 200)
                                      : CustomButton(
                                          text: "Filter",
                                          onTap: () {
                                            Get.back();
                                            controller.getFilteredProductList();
                                          },
                                          buttonWidth: 200),
                                )
                              ],
                            )
                          ],
                        ),

                        // ====================== Reset Button ==============================
                        Positioned(
                          top: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              controller.categoryName.value = "0";
                              controller.maximumPriceController.clear();
                              controller.minimumPriceController.clear();
                              controller.ratingFilterIndex.value = "";
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.restart_alt, color: AppColors.bg1LightColor, size: 35),
                                CustomTextWidget(text: "Reset", fontSize: 10)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Row(
          children: [
            Icon(
              Icons.filter_list_sharp,
              size: 30,
              color: Colors.white,
            ),
            CustomTextWidget(
              text: "Filter",
              fontSize: 14,
              fontColor: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
