import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/config/size_config.dart';

import '../../../controller/home_conttoller.dart';
import '../../../core/theme/app_colors.dart';
import '../../widget/custom_text.dart';

class BuildPriceSlider extends StatelessWidget {
  const BuildPriceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: Get.put<HomeController>(HomeController()),
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: 'Price',
                color: AppColors.caffe,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: AppColors.orangeDark,
                inactiveTrackColor: AppColors.orangDarkOpasty,
                // Custom Gray Color
                // Custom Thumb overlay Color
                rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
                valueIndicatorTextStyle: TextStyle(fontSize: 12.sp),
                valueIndicatorShape: const RoundSliderThumbShape(enabledThumbRadius: 100.0),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: RangeSlider(
                values: controller.priceRangeValue.value,
                onChanged: (value) {
                  controller.priceRangeValue.value = value;
                  controller.priceRabeLabels.value = RangeLabels(
                    value.start.toInt().toString(),
                    value.end.toInt().toString(),
                  );
                },
                max: 1000,
                min: 100,
                onChangeEnd: (value) {
                  controller.priceRangeValue.value = value;
                  controller.priceRabeLabels.value = RangeLabels(
                    value.start.toInt().toString(),
                    value.end.toInt().toString(),
                  );
                  controller.filter();
                },
                labels: controller.priceRabeLabels.value,
                divisions: 100,
                onChangeStart: (value) {
                  controller.priceRangeValue.value = value;
                  controller.priceRabeLabels.value = RangeLabels(
                    value.start.toInt().toString(),
                    value.end.toInt().toString(),
                  );
                  controller.filter();
                },
                activeColor: AppColors.orangeDark,
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: controller.priceRabeLabels.value.start,
                  color: AppColors.orange,
                ),
                const Spacer(),
                CustomText(
                  text: controller.priceRabeLabels.value.end,
                  color: AppColors.orange,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
