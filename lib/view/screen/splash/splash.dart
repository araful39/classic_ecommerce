import 'package:classic_ecommerce/controller/local_storage/local_data.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:classic_ecommerce/view/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String version = "";
  getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

  bool alreadyLogin = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    getAppInfo();
    _alreadyLogin();
    logoAnimationController();
  }

  _alreadyLogin() async {
    var a = await LocalData().readData(key: "userInfo");
    if (a != "") {
      alreadyLogin = true;
    } else {
      alreadyLogin = false;
    }
  }

  logoAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.01, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeInBack,
      ),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        alreadyLogin
            ? Get.offAll(() => const BottomNavBarScreen())
            : Get.offAll(() => const WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ScaleTransition(
          filterQuality: FilterQuality.medium,
          scale: _animation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/app_logo.png',
                  height: 400,
                  width: 350,
                ),
                SizedBox(height: 20),
                Text(
                  "Let's get start..".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: AppColors.bg1LightColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextWidget(
              text: "Version :  ",
              fontColor: AppColors.bg1LightColor,
            ),
            CustomTextWidget(
              text: version,
              fontColor: AppColors.bg1LightColor,
            ),
          ],
        ),
      ),
    );
  }
}
