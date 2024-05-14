import 'package:flutter/material.dart';
import 'package:restaurants_app/core/config/extentions.dart';
import 'package:restaurants_app/core/config/size_config.dart';

import '../../core/theme/app_colors.dart';
import 'custom_text.dart';

class BuildRowOfText extends StatelessWidget {
  final String textKey, textValue;
  final double width;
  final double fontSize;
  const BuildRowOfText({
    super.key,
    required this.textKey,
    required this.textValue,
    this.width = 80,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: textKey,
            textAlign: TextAlign.start,
            color: AppColors.caffe,
            size: fontSize.sp,
            fontWeight: FontWeight.w600,
            heigtText: 0,
          ),
          5.w.pw,
          Expanded(
            child: CustomText(
              text: textValue,
              textAlign: TextAlign.start,
              color: AppColors.orange,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              size: fontSize.sp,
              fontWeight: FontWeight.w600,
              heigtText: 0,
            ),
          ),
        ],
      ),
    );
  }
}
