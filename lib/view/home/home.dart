import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/controller/home_conttoller.dart';
import 'package:restaurants_app/core/config/extentions.dart';
import 'package:restaurants_app/core/config/size_config.dart';
import 'package:restaurants_app/core/theme/app_colors.dart';
import 'package:restaurants_app/view/home/widgets/build_price_slider.dart';

import '../../controller/search_controller.dart';
import '../widget/custom_form_text_field.dart';
import 'widgets/build_filter.dart';
import 'widgets/build_restaurants_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants Demo"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<AppSearchController>(
                init: Get.put<AppSearchController>(AppSearchController()),
                builder: (searchCont) {
                  return Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.greyUiBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BrandSearchTextForm(
                      onSearch: () {
                        HomeController.instance.searchingText.value = searchCont.searshText.text.trim();
                        HomeController.instance.filter();
                      },
                      onClosse: () {
                        HomeController.instance.searchingText.value = "";
                        HomeController.instance.filter();
                      },
                    ),
                  );
                },
              ),
              20.h.ph,
              const BuildFiltter(),
              20.h.ph,
              const BuildPriceSlider(),
              20.h.ph,
              const Expanded(
                child: BuildRestaurantsListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
