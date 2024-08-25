import 'dart:io';
import 'package:classic_ecommerce/controller/ui_controller/profile.dart';
import 'package:classic_ecommerce/utils/common_function/common_snackbar_message.dart';
import 'package:classic_ecommerce/utils/common_function/internet_connection_checker.dart';
import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_loading_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/profile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfileEditSection extends StatelessWidget {
  const ProfileEditSection({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, right: 10, left: 10, top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: "profile_edit".tr,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                profileController.getImage(imageSource: ImageSource.gallery);
              },
              child: Column(
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      backgroundImage: profileController.profileIMG.value == null
                          ? NetworkImage("${profileController.userInfo['Profile_image'] ?? ""}")
                          : FileImage(File(profileController.profileIMG.value!.path)) as ImageProvider,
                    ),
                  ),
                  const CustomTextWidget(text: "Tap to Change Image", fontSize: 11)
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: profileController.nameController,
              labelText: 'name'.tr,
            ),
            CustomTextField(
              controller: profileController.addressController,
              labelText: 'address'.tr,
            ),
            const SizedBox(height: 10),
            Obx(
              () => profileController.isLoading.value
                  ? const CustomLoadingButton(buttonWidth: 150)
                  : CustomButton(
                      text: "edit".tr,
                      buttonWidth: 150,
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        if (!await ConnectionChecker.checkConnection()) {
                          CommonSnackBarMessage.noInternetConnection();
                          return;
                        }
                        bool status = await profileController.profileUpdateService();
                        if (status) {
                          await profileController.getProfileInfo();
                          Get.back();
                        }
                        //Get.back();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
