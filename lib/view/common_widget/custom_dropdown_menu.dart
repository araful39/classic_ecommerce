import 'package:classic_ecommerce/model/category_list_for_filter.dart';
import 'package:classic_ecommerce/utils/app_colors.dart';
import 'package:classic_ecommerce/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({super.key, required this.list, required this.initialSelection, required this.function});
  final RxList<MainCategory> list;
  final String initialSelection;
  final Function(String?) function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: DropdownMenu<String>(
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: BoxConstraints.tight(const Size.fromHeight(40)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        width: MediaQuery.sizeOf(context).width - 30,
        initialSelection: initialSelection,
        onSelected: function,
        menuHeight: 220,
        dropdownMenuEntries: list
            .map((value) => DropdownMenuEntry<String>(
                  value: value.categoryId.toString(),
                  label: value.categoryName.toString(),
                  labelWidget: CustomTextWidget(text: value.categoryName.toString(), fontColor: AppColors.bg1LightColor),
                  leadingIcon: const Icon(Icons.arrow_right_sharp, color: AppColors.bg1LightColor),
                ))
            .toList(),
      ),
    );
  }
}
