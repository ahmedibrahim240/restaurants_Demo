import 'package:flutter/material.dart';

// extension ImagePath on String {
//   String get toSvg => 'assets/images/$this.svg';
// }

extension Emptypadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

// extension ThemePrvider on BuildContext {
//   ThemeData get currentTheme => Theme.of(this);
// }

// extension ThemeShortCuts on BuildContext {
//   TextTheme get textTheme => Theme.of(this).textTheme;
  // ElevatedButtonThemeData get elevatedButtonTheme =>
  //     Theme.of(this).elevatedButtonTheme;
  // TextStyle? get headLinesmail => Theme.of(this).textTheme.headlineSmall;
  // Color? get prinmaryColor => Theme.of(this).primaryColor.;
// }

// extension MediaQueryValues on BuildContext {
//   double get width => MediaQuery.of(this).size.width;
//   double get height => MediaQuery.of(this).size.height;
//   double get topPading => MediaQuery.of(this).padding.top;
// }
