import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSearchController extends GetxController {
  static AppSearchController instance = Get.find();
  Rx<bool> isSearch = false.obs;

  Rx<bool> showSearhFild = false.obs;
  Rx<bool> showSelcettedAll = false.obs;
  Rx<bool> showIcon = false.obs;

  TextEditingController searshText = TextEditingController(text: '');

  searchState(BuildContext context, {bool isTab = false}) {
    showIcon.value = searshText.text.isNotEmpty;

    if (isTab) {
      isSearch.value = true;
    } else {
      isSearch.value = false;
      showSearhFild.value = false;
      FocusScope.of(context).unfocus();
    }
    update();
  }
}
