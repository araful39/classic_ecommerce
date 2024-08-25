import 'package:classic_ecommerce/controller/api_controller/authentication/log_out.dart';
import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:classic_ecommerce/controller/ui_controller/profile.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/profile/widget/custom_switch.dart';
import 'package:classic_ecommerce/view/screen/profile/widget/log_out.dart';
import 'package:classic_ecommerce/view/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_password_section.dart';
import 'setting_custom_list_tile.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildSizedBox(height: 5),
              /// Change Password
              SettingListTile(
                title: "change_password".tr,
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (builder) {
                        return const ChangePasswordSection();
                      });
                },
              ),

              /// Change Language
              Card(
                elevation: .4,
                surfaceTintColor: Colors.transparent,
                shape: const OutlineInputBorder(borderSide: BorderSide.none),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: CustomTextWidget(text: "language_change".tr),
                    ),
                    CustomSwitch(
                      onTap: () {
                        profileController.languageBN.value ? Get.updateLocale(const Locale("en", "US")) : Get.updateLocale(const Locale("bn", "BD"));
                        profileController.languageBN.value
                            ? LocalData().writeData(key: "languageType", value: "EN")
                            : LocalData().writeData(key: "languageType", value: "BN");
                        profileController.languageBN.value = !profileController.languageBN.value;
                      },
                      onText: "EN",
                      offText: "BN",
                      value: profileController.languageBN,
                    )
                  ],
                ),
              ),

              /// Log Out
              LogOut(
                onTap: () async {
                  buildLogOutDialog();
                },
              ),
              buildSizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildLogOutDialog() {
    return Get.defaultDialog(
      title: "Confirmation",
      titleStyle: const TextStyle(fontSize: 22, fontFamily: "RobotoSerif"),
      content: const CustomTextWidget(
        text: "Do you want to log out?",
        fontSize: 17,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const CustomTextWidget(
                  text: "Cancel",
                  fontColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () async {
                var status = await LogOutService.logOutService();
                if (status) {
                  await LocalData().deleteData(key: "userInfo");
                  await LocalData().deleteData(key: "token");
                  Get.offAll(() => const WelcomeScreen());
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const CustomTextWidget(
                  text: "Log Out",
                  fontColor: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Common Sized Box
  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
