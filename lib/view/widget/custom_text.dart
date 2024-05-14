import 'package:flutter/material.dart';
import 'package:restaurants_app/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final bool isInButtonOrTab;
  final String text;
  final Color? color;
  final double? size, heigtText;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool underline;
  final int? maxTextLiens;
  final double? letterSpacing;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.letterSpacing,
    this.maxLines,
    this.textOverflow, //ThemeController
    this.fontWeight,
    this.heigtText,
    this.textAlign,
    this.underline = false,
    this.maxTextLiens,
    this.isInButtonOrTab = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      maxTextLiens == null
          ? _capitalizeFirstLetter(text)
          : _capitalizeFirstLetter(text).length > maxTextLiens!
              ? '${_capitalizeFirstLetter(text).substring(0, maxTextLiens)}...'
              : _capitalizeFirstLetter(text),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        letterSpacing: letterSpacing,
        decoration: (!underline) ? null : TextDecoration.underline,
        color: color ?? AppColors.white,
        fontSize: size ?? 16,
        fontWeight: fontWeight,
        height: heigtText ?? 1,
        fontFamily: 'Cairo',
      ),
    );
  }

  String _capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}
