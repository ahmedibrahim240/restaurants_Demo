//todo assetsRootes
// ignore_for_file: unused_element,  staticant_identifier_names, non_ staticant_identifier_names
class AssetImagePath {
  static const String svgAssetsRoot = "assets/svg/";

//!ImagesPaTh
  static String logoSvg = _getSVGImagePath("logo.svg");
  static String restaurant = _getSVGImagePath("restaurant.jpg");

  static String _getSVGImagePath(String fileName) {
    return svgAssetsRoot + fileName;
  }
}
