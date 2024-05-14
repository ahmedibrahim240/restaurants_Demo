import 'package:flutter/material.dart';

class AppColors {
  static Color orangeDark = const Color(0xFF9B7029);
  static Color scaffoldBackgroundColor = const Color(0xFF0c0c0c);
  static Color redColor = const Color(0xFFC52929);
  static Color orange = const Color(0xFFC38622);
  static Color white = Colors.white;
  static Color borderwhite2Color = const Color(0xFF6B6B6B);
  static Color textgreyColor = const Color(0xFF7F7F7F);
  static Color greyUiBackground = const Color(0xFF181818);
  static Color caffe = const Color(0xFFDDCEB5);
  static Color orangDarkOpasty = const Color(0x269b7028);

  static ColorScheme colorScheme = ColorScheme.dark(
    background: greyUiBackground,
    primary: orangeDark, // <-- SEE HERE
    onPrimary: orangeDark, // <-- SEE HERE
    onSurface: orangeDark,
  );
}
