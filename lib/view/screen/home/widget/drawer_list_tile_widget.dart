import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                icon,
                color: AppColors.bg1LightColor,
              ),
            ),
            Expanded(
              flex: 8,
              child: CustomTextWidget(text: title),
            ),
          ],
        ),
      ),
    );
  }
}
