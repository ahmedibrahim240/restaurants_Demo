import 'package:flutter/widgets.dart';
import 'dart:math' show min;
// , max

extension ScreenUtilExtension on num {
  double get sp => SizeConfig.setSp(toDouble());
  double get r => SizeConfig.setR(toDouble());
  double get w => SizeConfig.setWidth(toDouble());
  double get h => SizeConfig.setHeight(toDouble());
}

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _uiWidth;
  static late double _uiHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;
  static late double _scaleText;

  static void init(
    BuildContext context, {
    required Size designSize,
    bool minTextAdapt = true,
  }) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height - 40;

    _uiWidth = designSize.width;
    _uiHeight = designSize.height;

    _scaleWidth = _screenWidth / _uiWidth;
    _scaleHeight = _screenHeight / _uiHeight;

    if (minTextAdapt) {
      _scaleText = min(_scaleWidth, _scaleHeight);
    } else {
      _scaleText = _scaleWidth;
    }
  }

//! responsive width
  static double setWidth(double width) {
    return width * _scaleWidth;
  }

//! responsive height
  static double setHeight(double height) {
    return height * _scaleHeight;
  }

//! responsive font size
  static double setSp(double fontSize) {
    return fontSize * _scaleText;
  }

//! responsive redios
  static double setR(double size) {
    return size * min(_scaleWidth, _scaleHeight);
  }
}
