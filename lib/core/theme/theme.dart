import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    useMaterial3: false,
    iconTheme: const IconThemeData(color: Colors.white),
    highlightColor: AppColors.orangeDark,
    colorScheme: AppColors.colorScheme,
    textTheme: ThemeData.dark().textTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.orangeDark, // button text color
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      foregroundColor: AppColors.white,
      centerTitle: true,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      titleTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo',
      ),
      elevation: 2,
      actionsIconTheme: IconThemeData(color: AppColors.white),
    ),
  );
}
