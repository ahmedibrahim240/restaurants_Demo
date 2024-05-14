// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurants_app/core/config/extentions.dart';
import 'package:restaurants_app/core/config/size_config.dart';
import 'package:restaurants_app/core/theme/app_colors.dart';

import 'custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.iconSize,
    required this.backgroundColor,
    this.textColor,
    this.icon,
    this.iconData,
    this.borderRadius = 2,
    this.elevation,
    required this.text,
  });
  final void Function()? onPressed;
  final double? width, height, iconSize;
  final Color? backgroundColor, textColor;
  final String? icon;
  final IconData? iconData;
  final String text;
  final double borderRadius;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: elevation != null ? MaterialStateProperty.all(elevation) : null,
        maximumSize: MaterialStateProperty.all(Size(width ?? 100, (height == null || height! <= 36) ? 36 : height!)),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? AppColors.orangeDark),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                height: iconSize,
                width: iconSize,
                color: textColor,
              )
            ] else if (iconData != null) ...[
              Icon(
                iconData!,
                size: iconSize,
                color: textColor,
              )
            ],
            if (icon != null) 5.w.pw,
            if (iconData != null) 5.w.pw,
            CustomText(
              isInButtonOrTab: true,
              text: text,
              heigtText: 0,
              textAlign: TextAlign.center,
              size: 17.sp,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
