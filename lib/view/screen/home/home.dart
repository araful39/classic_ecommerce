import 'package:classic_ecommerce/controller/ui_controller/home.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_appbar.dart';
import 'package:classic_ecommerce/view/common_widget/custom_banner_image.dart';
import 'package:classic_ecommerce/view/common_widget/custom_product_card_image.dart';
import 'package:classic_ecommerce/view/common_widget/custom_refresh_button.dart';
import 'package:classic_ecommerce/view/common_widget/custom_shimmer.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/all_product_list/all_shop_product.dart';
import 'package:classic_ecommerce/view/screen/category/category.dart';
import 'package:classic_ecommerce/view/screen/product_description/product_description.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/category_product_card.dart';
import 'widget/home_drawer.dart';
import 'widget/trending_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      key: homeController.scaffoldKey,
      drawer: HomeDrawer(size: size),
      appBar: CustomAppBar(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  homeController.scaffoldKey.currentState?.openDrawer();
                },
                child: const Icon(Icons.menu, color: Colors.white),
              ),
            ),
            buildSizedBox(width: 10),
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: () {
                  Get.to(() => const AllShopProduct());
                },
                child: Card(
                  child: SizedBox(
                    height: 30,
                    width: size.width / 1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [CustomTextWidget(text: "search".tr, fontSize: 12), const Icon(Icons.search, size: 15)],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => homeController.sliderLoading.isTrue
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height / 18),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(color: AppColors.bg1LightColor),
                            SizedBox(height: 10),
                            CustomTextWidget(
                              text: "Please Wait...",
                              fontColor: AppColors.bg1LightColor,
                              fontSize: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  : homeController.sliderImageList.isEmpty
                      ? CustomRefreshButton(height: size.height / 5, iconColorColor: Colors.red, refreshButton: () {})
                      : CarouselSlider(
                          carouselController: homeController.carouselController,
                          items: homeController.sliderImageList
                              .map((e) => CustomBannerImage(networkImage: e, height: size.height, width: size.width))
                              .toList(),
                          options: CarouselOptions(
                            aspectRatio: 16 / 7,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: Durations.short1,
                          ),
                        ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// =====================================  Category List   ==============
                  buildSizedBox(height: 10),
                  CustomTextWidget(text: "category".tr, fontSize: 18, fontWeight: FontWeight.w500),
                  Obx(
                    () => homeController.categoriesLoading.isTrue
                        ? SizedBox(
                            height: size.height / 6.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int i) {
                                return CustomShimmer(
                                  height: 80,
                                  width: 100,
                                  margin: 5,
                                  highlightColor: Colors.white,
                                  baseColor: Colors.grey.shade200,
                                  containerColor: Colors.white,
                                );
                              },
                            ),
                          )
                        : homeController.categories.isEmpty
                            ? CustomRefreshButton(
                                height: 100,
                                containerColor: Colors.grey.shade100,
                                iconColorColor: AppColors.bg1LightColor,
                                refreshButton: () {
                                  homeController.getCategoryData();
                                })
                            : SizedBox(
                                height: size.height / 6.5,
                                child: ListView.builder(
                                  controller: homeController.categoryScrollController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeController.categories.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return CategoryProductCart(
                                      onTap: () {
                                        Get.to(
                                          () => const Category(),
                                          arguments: i,
                                          curve: Curves.easeIn,
                                          transition: Transition.fadeIn,
                                          duration: const Duration(milliseconds: 100),
                                        );
                                      },
                                      image: "${homeController.categories[i].categoryImage}",
                                      name: homeController.categories[i].categoryName?.en ?? "",
                                      height: 80,
                                      width: 80,
                                    );
                                  },
                                ),
                              ),
                  ),

//=====================================================  Trending Now  ==============
                  CustomTextWidget(text: "trending".tr, fontSize: 18, fontWeight: FontWeight.w500),
                  TrendingView(homeController: homeController),

//================================================= Flash Sale Banner   ================
                  buildSizedBox(height: 5),
                  CustomTextWidget(text: "flash_sale".tr, fontSize: 18, fontWeight: FontWeight.w500),
                  Obx(
                    () => homeController.flashSaleLoading.isTrue
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(color: AppColors.bg1LightColor),
                                buildSizedBox(height: 5),
                                const CustomTextWidget(text: "Please Wait...", fontColor: AppColors.bg1LightColor, fontSize: 20)
                              ],
                            ),
                          )
                        : homeController.flashSaleList.isEmpty
                            ? CustomRefreshButton(
                                height: size.height / 6.1,
                                containerColor: Colors.grey.shade100,
                                iconColorColor: AppColors.bg1LightColor,
                                refreshButton: () {},
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CarouselSlider(
                                    carouselController: homeController.carouselController,
                                    items: homeController.flashSaleList
                                        .map(
                                          (e) => CustomBannerImage(networkImage: e, height: size.height, width: size.width),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                        aspectRatio: size.height / 240,
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(seconds: 2),
                                        autoPlayAnimationDuration: Durations.short1),
                                  ),
                                ],
                              ),
                  ),

//=================================================  Just for you   ========================
                  buildSizedBox(height: 10),
                  CustomTextWidget(text: "just_for_you".tr, fontSize: 18, fontWeight: FontWeight.w500),

                  Obx(
                    () => homeController.justForYouLoading.isTrue
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .62, crossAxisCount: 2),
                            itemCount: 2,
                            itemBuilder: (_, index) {
                              return CustomShimmer(
                                height: 80,
                                width: 100,
                                margin: 5,
                                highlightColor: Colors.white,
                                baseColor: Colors.grey.shade200,
                                containerColor: Colors.white,
                              );
                            })
                        : homeController.justForYouProductList.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomRefreshButton(
                                    height: 270,
                                    containerColor: Colors.grey.shade100,
                                    refreshButton: () {
                                      homeController.getJustForYouProducts();
                                    }),
                              )
                            : GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .6, crossAxisCount: 3),
                                itemCount: homeController.justForYouProductList.length,
                                itemBuilder: (_, index) {
                                  return CustomProductCardImage(
                                    productData: homeController.justForYouProductList[index],
                                    onTap: () {
                                      Get.to(ProductDescription(productData: homeController.justForYouProductList[index]),
                                          curve: Curves.easeIn,
                                          transition: Transition.fadeIn,
                                          duration: const Duration(milliseconds: 500),
                                          arguments: homeController.justForYouProductList[index].productId.toString());
                                    },
                                    height: 200,
                                    width: 100,
                                  );
                                },
                              ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => const AllShopProduct(),
                              curve: Curves.easeIn, transition: Transition.downToUp, duration: const Duration(milliseconds: 100));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                            decoration: BoxDecoration(color: AppColors.bg1LightColor, borderRadius: BorderRadius.circular(10)),
                            child: CustomTextWidget(text: "see_more".tr, fontSize: 18, fontColor: Colors.white, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  buildSizedBox(height: 80),
                ],
              ),
            )
          ],
        ),
      ),
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
