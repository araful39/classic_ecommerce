import 'dart:developer';
import 'package:classic_ecommerce/controller/ui_controller/checkout.dart';
import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/shipping_&_checkout/order_success/order_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'widget/cancel_button.dart';
import 'widget/payment_method_info.dart';
import 'widget/pricing_info_card.dart';
import 'widget/shipping_info_card.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("summary".tr),
      ),
      backgroundColor: Colors.brown,
      body: Card(
        shadowColor: Colors.greenAccent,
        surfaceTintColor: Colors.green,
        shape: const OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
        margin: EdgeInsets.zero,
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shipping Information
                  ShippingInfoCard(controller: checkoutController),

                  // Pricing Information
                  PricingInfoCard(
                    checkoutController: checkoutController,
                  ),

                  // Payment Card
                  PaymentMethodInfo(
                    checkoutController: checkoutController,
                  ),

                  buildSizedBox(height: 10),
                  CustomButton(
                    text: 'continue'.tr,
                    onTap: () async {
                      log("Call");
                      buildDefaultDialog(confirmButton: () async {
                        Get.back();
                        await EasyLoading.show();
                        bool status = await checkoutController.orderStoreServices();
                        if (status) {
                          Get.offAll(() => const OrderSuccessful());
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom Dialogue
  Future<dynamic> buildDefaultDialog({required VoidCallback confirmButton}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: "payment_confirmation".tr,
        titleStyle: const TextStyle(fontSize: 25, fontFamily: "RobotoSerif", fontWeight: FontWeight.w600),
        content: CustomTextWidget(
          text: "payment_confirmation_message".tr,
          fontSize: 17,
          maxLine: 5,
        ),
        actions: [
          ConfirmCancelDialogueButton(
            confirmButton: confirmButton,
          )
        ]);
  }

  // Common Sized Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
