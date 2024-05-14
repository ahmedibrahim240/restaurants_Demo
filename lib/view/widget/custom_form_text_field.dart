import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/theme/app_colors.dart';

import '../../controller/search_controller.dart';

class BrandSearchTextForm extends StatelessWidget {
  final String labelText;
  final bool showIcon;
  final Widget? suffixIcon;
  final void Function() onSearch;
  final void Function()? onTap;
  final void Function() onClosse;
  const BrandSearchTextForm({
    this.suffixIcon,
    this.labelText = 'Search..',
    super.key,
    required this.onSearch,
    this.onTap,
    required this.onClosse,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<AppSearchController>(
      init: Get.put<AppSearchController>(AppSearchController()),
      builder: (controller) {
        return TextFormField(
          cursorColor: AppColors.orangeDark,
          controller: controller.searshText,
          mouseCursor: MouseCursor.uncontrolled,
          onTap: onTap ?? () => controller.searchState(context, isTab: true),
          onTapOutside: (point) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (text) {
            controller.showIcon.value = text.isNotEmpty;
            // controller.searshText.text = text;
            // EasyDebounce.cancelAll();
            // EasyDebounce.debounce('_search', const Duration(milliseconds: 500), () async {
            //   onSearch();
            // });
          },
          onFieldSubmitted: (str) {
            if (controller.searshText.text.isEmpty) {
              controller.searchState(context, isTab: false);
              onSearch();
              FocusScope.of(context).unfocus();
            } else {
              onSearch();
              FocusScope.of(context).unfocus();
              return;
            }
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            // labelText: labelText,
            contentPadding: EdgeInsets.zero,
            hintText: labelText,
            fillColor: AppColors.greyUiBackground,
            filled: false,

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            suffixIcon: ((controller.isSearch.value) && controller.showIcon.value)
                ? InkWell(
                    onTap: () {
                      onSearch();
                    },
                    child: Icon(
                      Icons.search_outlined,
                      color: AppColors.orangeDark,
                      size: 20,
                    ),
                  )
                : null,
            prefixIcon: showIcon
                ? InkWell(
                    onTap: () {
                      if (controller.isSearch.value) {
                        controller.searchState(context, isTab: false);
                        controller.searshText.clear();
                        onClosse();
                      }
                    },
                    child: Icon(
                      (controller.isSearch.value) ? Icons.clear : Icons.search_outlined,
                      color: (controller.isSearch.value) ? AppColors.redColor : AppColors.white,
                      size: 20,
                    ),
                  )
                : ((controller.isSearch.value) && !showIcon && !FocusScope.of(context).hasFocus)
                    ? InkWell(
                        onTap: () {
                          onSearch();
                        },
                        child: Icon(
                          Icons.search_outlined,
                          color: AppColors.orangeDark,
                          size: 20,
                        ),
                      )
                    : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            labelStyle: TextStyle(
              color: (controller.isSearch.value) ? AppColors.textgreyColor : AppColors.orangeDark,
            ),
            hintStyle: TextStyle(
              color: (controller.isSearch.value) ? AppColors.textgreyColor : AppColors.orangeDark,
              fontSize: 14,
              height: 1.22,
            ),
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}
