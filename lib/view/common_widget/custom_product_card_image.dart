
import 'dart:developer';
import 'package:classic_ecommerce/model/all_product_list.dart';
import 'package:classic_ecommerce/view/common_widget/custom_rating.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:classic_ecommerce/view/screen/product_description/widget/discount_price_text.dart';
import 'package:classic_ecommerce/view/screen/product_description/widget/discount_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomProductCardImage extends StatelessWidget {
  const CustomProductCardImage({
    super.key,
    required this.productData,
    required this.onTap,
    required this.height,
    required this.width,
  });

  final Products productData;
  final VoidCallback onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    log("------- ${productData.image} --------");
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: "${productData.image}",
        imageBuilder: (context, imageProvider) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(3), image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(text: productData.nameEn.toString(), fontSize: 12, maxLine: 2),
                              CustomRating(ratingStar: productData.rating?.toInt() ?? 0),
                              DiscountPrice(
                                  regularPrice: double.parse(productData.regPrice.toString()),
                                  discountPrice: double.parse(productData.disPrice.toString()),
                                  discountType: productData.disType.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: -35,
                  child: DiscountTag(
                    discountType: productData.disType?.toInt() ?? 0,
                    discountPrice: double.parse(productData.disPrice.toString()),
                  ),
                ),
              ],
            ),
          );
        },
        placeholder: (context, url) => Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300)),
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            period: const Duration(milliseconds: 1000),
            child: Container(color: Colors.grey, height: height, width: width),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: height / 10, color: Colors.red),
              const SizedBox(height: 10),
              const CustomTextWidget(text: "No Image Found..!!", fontColor: Colors.black54, fontSize: 12)
            ],
          ),
        ),
      ),
    );
  }
}
