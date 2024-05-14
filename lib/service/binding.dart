import 'package:get/get.dart';

import '../controller/home_conttoller.dart';
import '../controller/search_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<AppSearchController>(AppSearchController());
  }
}
