import 'package:classic_ecommerce/controller/ui_controller/bottom_nav_bar.dart';
import 'package:classic_ecommerce/controller/ui_controller/profile.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'drawer_list_tile_widget.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, right: 10, left: 10,bottom: 10),
            width: size.width,
            height: 185,
            decoration: const BoxDecoration(
                color: AppColors.bg1LightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SizedBox(
                      height: 80,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: "assets/images/splash_logo.png",
                            image: "${profileController.userInfo['Profile_image'] ?? ""}",
                            imageErrorBuilder: (context, o, t) {
                              return const CircleAvatar(
                                backgroundImage: NetworkImage("https://i.pinimg.com/736x/0c/6f/39/0c6f39dac4d7f30139a7d61ee28a2ef5.jpg"),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomTextWidget(
                    text: "${profileController.userInfo['name'] ?? ". . . . . . . . . . . . . . . . . ."}",
                    fontColor: Colors.white,
                    fontSize: 17,
                  ),
                  CustomTextWidget(
                    text: "${profileController.userInfo['email'] ?? ". . . . . . . . . . . . . . . . . ."}",
                    fontColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              children: [
                const SizedBox(height: 5),
                DrawerListTile(
                  onTap: () {
                    Get.back();
                  },
                  icon: Icons.home,
                  title: 'Home',
                ),
                DrawerListTile(
                  onTap: () {
                    Get.back();
                    BottomNavBarController controller = Get.put(BottomNavBarController());
                    controller.page.value = 4;
                  },
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                DrawerListTile(
                  onTap: () {
                    Get.back();
                    BottomNavBarController controller = Get.put(BottomNavBarController());
                    controller.page.value = 3;
                  },
                  icon: Icons.shop,
                  title: 'My Orders',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const CustomTextWidget(
                    text: "Developed by : ",
                    fontSize: 12,
                    fontColor: AppColors.bg1LightColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      var url = Uri.parse("https://classicit.com.bd/");
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: const CustomTextWidget(
                      text: "Classic It & Sky Mart",
                      fontColor: AppColors.bg1LightColor,
                    ),
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}


