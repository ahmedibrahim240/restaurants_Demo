import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/config/extentions.dart';
import 'package:restaurants_app/core/config/size_config.dart';

import '../../../controller/home_conttoller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utilities/utilities.dart';
import '../../../models/cuisine_type.dart';
import '../../widget/custom_text.dart';

class BuildFiltter extends StatelessWidget {
  const BuildFiltter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "HomeFilter",
      builder: (homeCont) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: 'Suisines Type',
                color: AppColors.caffe,
              ),
            ),
            15.h.ph,
            SizedBox(
              width: MediaQuery.of(context).size.width * .95,
              height: 30.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Utilities.suisinesTypeList.length,
                itemBuilder: (context, index) {
                  CuisinesTypeModels cuisines = Utilities.suisinesTypeList[index];
                  return GestureDetector(
                    onTap: () {
                      homeCont.setTypeFiltter(cuisines.id);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      width: 80.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: homeCont.typeFiltterId.value == cuisines.id ? AppColors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          width: 1.5,
                          color: homeCont.typeFiltterId.value == cuisines.id ? Colors.transparent : AppColors.borderwhite2Color,
                        ),
                      ),
                      child: FittedBox(
                        child: CustomText(
                          text: Utilities.setCuisinesTypeTitle(cuisines.type),
                          textAlign: TextAlign.center,
                          size: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
