import 'package:classic_ecommerce/view/common_widget/custom_button.dart';
import 'package:classic_ecommerce/view/screen/all_product_list/all_shop_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NoCartProductFoundWidget extends StatelessWidget {
  const NoCartProductFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height / 6),
          Image.asset(
            'assets/images/no_data.png',
            fit: BoxFit.fill,
            height: size.height / 3,
            width: size.width / 1.5,
          ),
          SizedBox(height: size.height / 20),
          CustomButton(
            text: "Add Product",
            buttonWidth: size.width / 1.5,
            onTap: () {
              Get.to(() => const AllShopProduct());
            },
          )
        ],
      ),
    );
  }
}
