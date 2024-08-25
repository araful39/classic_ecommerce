import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveredItemListTileCard extends StatelessWidget {
  const DeliveredItemListTileCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productUnitPrice,
    required this.productQty,
  });
  final String productImage;
  final String productName;
  final String productUnitPrice;
  final String productQty;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(productImage),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: productName, maxLine: 2, fontSize: 15, fontWeight: FontWeight.w500),
                Row(
                  children: [
                    Row(
                      children: [
                        const CustomTextWidget(text: "Unit Price : ", fontSize: 12),
                        CustomTextWidget(
                          text: "$productUnitPrice TK",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const CustomTextWidget(text: "Qty : ", fontSize: 11),
                        CustomTextWidget(
                          text: productQty,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CustomTextWidget(text: "Total Price : ", fontSize: 12),
                    CustomTextWidget(
                      text: "${(double.parse(productUnitPrice) * double.parse(productQty)).toStringAsFixed(2)} TK",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
