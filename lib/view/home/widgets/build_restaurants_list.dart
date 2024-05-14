import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/config/assets_images_path.dart';
import 'package:restaurants_app/core/config/extentions.dart';
import 'package:restaurants_app/core/config/size_config.dart';

import '../../../controller/home_conttoller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utilities/utilities.dart';
import '../../widget/build_row_of_text.dart';
import '../../widget/custom_text.dart';

class BuildRestaurantsListView extends StatelessWidget {
  const BuildRestaurantsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "restaurantsList",
        init: Get.put<HomeController>(HomeController()),
        builder: (homeCont) {
          return homeCont.getRestaurantsList.isEmpty
              ? SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        80.h.ph,
                        SvgPicture.asset(
                          AssetImagePath.logoSvg,
                          height: 100,
                          width: 100,
                        ),
                        10.h.ph,
                        const Center(
                          child: CustomText(text: "No data"),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView(
                  padding: EdgeInsets.zero,
                  children: homeCont.getRestaurantsList
                      .map(
                        (e) => Card(
                          color: AppColors.greyUiBackground,
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * .3,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.r),
                                        topRight: Radius.circular(15.r),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          e.image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    margin: EdgeInsets.all(8.h),
                                    child: Column(
                                      children: [
                                        CustomText(
                                          text: e.name,
                                          color: AppColors.orangeDark,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.start,
                                          size: 20.sp,
                                        ),
                                        8.h.ph,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: BuildRowOfText(
                                                textKey: "Type",
                                                textValue: Utilities.setCuisinesTypeTitle(
                                                  e.type.type,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: BuildRowOfText(
                                                textKey: "Price",
                                                textValue: e.price.toString(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
        });
  }
}
