import 'package:classic_ecommerce/controller/ui_controller/product_description.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_shimmer.dart';
import 'package:classic_ecommerce/view/common_widget/image_view_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderImageSection extends StatelessWidget {
  const SliderImageSection({super.key, required this.descriptionController});

  final DescriptionController descriptionController;
  @override
  Widget build(BuildContext context) {
    List<String>? imageList = descriptionController.imageList;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 3),
            child: Obx(
              () => descriptionController.imageList.isEmpty
                  ? SizedBox(
                      height: 240,
                      width: 80,
                      child: ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CustomShimmer(
                              height: 80,
                              width: 80,
                              margin: 1,
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade200,
                              containerColor: Colors.white,
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 240,
                      width: MediaQuery.sizeOf(context).width / 4.3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: descriptionController.imageList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                descriptionController.selectedImgIndex.value = index;
                                descriptionController.carouselController.animateToPage(index);
                              },
                              child: Obx(
                                () => Container(
                                  margin: buildEdgeInsets(h: 5, v: 5),
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: descriptionController.selectedImgIndex.value == index
                                        ? Border.all(color: AppColors.bg1LightColor, width: 2, strokeAlign: BorderSide.strokeAlignOutside)
                                        : Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffFFEDE5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage("${descriptionController.imageList[index]}"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 2),
              height: 230,
              width: MediaQuery.sizeOf(context).width / 2,
              child: Obx(
                () => descriptionController.imageList.isEmpty
                    ? CustomShimmer(
                        height: 185,
                        margin: 5,
                        highlightColor: Colors.white,
                        baseColor: Colors.grey.shade200,
                        containerColor: Colors.white,
                      )
                    : CarouselSlider(
                        carouselController: descriptionController.carouselController,
                        items: imageList
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  Get.to(() => ImageViewWidget(
                                        imgUrl: '$e',
                                      ));
                                },
                                child: Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage("$e"),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 16 / 12,
                          autoPlayCurve: Curves.slowMiddle,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: Durations.short1,
                          onPageChanged: (index, reason) {
                            descriptionController.selectedImgIndex.value = index;
                          },
                        ),
                      ),
              ),
            ),
          ),
        ],
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
