import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class OnGoingOrderListTileWidget extends StatelessWidget {
  const OnGoingOrderListTileWidget({
    super.key,
    required this.onGoingDetailsTap,
    required this.callTap,
  });
  final VoidCallback onGoingDetailsTap;
  final VoidCallback callTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGoingDetailsTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
         // color: AppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const NetworkImage("https://avatars.githubusercontent.com/u/106102340?v=4"),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: "MP015879s458d9f8",
                         // fontColor: AppColors.textDarkColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      CustomTextWidget(
                        text: "548.00",
                        //fontColor: AppColors.cardLightColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: "House 25,Road 12,Sector 14,Uttara-Dhaka",
                         // fontColor: AppColors.textDarkColor.withOpacity(.5),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          maxLine: 2,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CustomTextWidget(
                            text: "Payment :",
                          //  fontColor: AppColors.cardLightColor.withOpacity(.8),
                            fontSize: 12,
                          ),
                          SizedBox(width: 10),
                          CustomTextWidget(
                            text: "Bkash",
                           // fontColor: AppColors.cardLightColor.withOpacity(.8),
                            fontSize: 12,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: callTap,
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              CustomTextWidget(
                                text: "Call",
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
