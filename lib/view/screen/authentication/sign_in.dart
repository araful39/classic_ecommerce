import 'dart:developer';
import 'package:classic_ecommerce/controller/ui_controller/authentication/sign_in.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/utils/common_function/common_snackbar_message.dart';
import 'package:classic_ecommerce/utils/common_function/internet_connection_checker.dart';
import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_loading_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'sign_up.dart';
import 'widget/email_or_phone_login_field.dart';
import 'widget/password_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
       body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.bg1LightColor.withOpacity(.89)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSizedBox(height: size.height / 10),
                Image.asset(
                  "assets/images/cit_logo.png",
                  height: size.height / 3.5,
                  width: size.width / 1.2,
                  fit: BoxFit.fill,
                ),
                buildSizedBox(height: size.height / 40),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.cardLightColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(offset: const Offset(0, 3), color: AppColors.appbarLightColor.withOpacity(.5), blurRadius: 16),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: "sign_in".tr,
                        fontColor: AppColors.bg1LightColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                      buildSizedBox(),
                      Form(
                        key: signInFormKey,
                        child: Column(
                          children: [
                            EmailOrPhoneLoginTextField(controller: signInController.emailController),
                            PasswordTextField(
                              controller: signInController,
                              onTap: () {
                                signInController.isPasswordEnable.value = !signInController.isPasswordEnable.value;
                              },
                            )
                          ],
                        ),
                      ),
                      buildSizedBox(height: 10),

                      Obx(
                        () => signInController.isLoading.value
                            ? const CustomLoadingButton(
                                buttonWidth: 150,
                              )
                            : CustomButton(
                                text: "sign_in".tr,
                                buttonWidth: 150,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (!signInFormKey.currentState!.validate()) {
                                    return;
                                  }
                                  if (!await ConnectionChecker.checkConnection()) {
                                    CommonSnackBarMessage.noInternetConnection();
                                    return;
                                  }
                                  signInController.isLoading.value = true;
                                  await EasyLoading.show();
                                  bool status = await signInController.signInService();
                                  log("------ Login Service - status : $status");
                                  signInController.isLoading.value = false;
                                  if (status) {
                                    Get.offAll(() => const BottomNavBarScreen());
                                  }
                                },
                              ),
                      ),

                      buildSizedBox(height: 10),

                      /// Don't have an account ? sign in
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(text: "Don't have an account? ".tr),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUp());
                            },
                            child: CustomTextWidget(
                              text: "sign_up".tr,
                              fontColor: AppColors.appbarLightColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
