import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/core/utilities/utilities.dart';

import '../models/restaurants.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  Rx<int> typeFiltterId = 100.obs;
  Rx<List<RestaurantsModels>> restaurantsList = Rx<List<RestaurantsModels>>(<RestaurantsModels>[]);
  List<RestaurantsModels> get getRestaurantsList => restaurantsList.value;
  List<RestaurantsModels> mainRestaurants = Utilities.restaurantsList;
  Rx<String> searchingText = "".obs;
  Rx<RangeValues> priceRangeValue = Rx<RangeValues>(const RangeValues(100, 1000));
  Rx<RangeLabels> priceRabeLabels = Rx<RangeLabels>(const RangeLabels("100", '1000'));

  @override
  void onInit() {
    typeFiltterId.value = 100;
    priceRangeValue.value = const RangeValues(100, 1000);
    priceRabeLabels.value = const RangeLabels("100", '1000');
    restaurantsList.value = mainRestaurants;
    restaurantsList.value.sort((a, b) => a.price.compareTo(b.price));
    super.onInit();
  }

  filter() {
    List<RestaurantsModels> result = [];
    result = filterByText(mainRestaurants);
    result = filterByPrice(result);
    result = filterByType(result);
    restaurantsList.value = result;
    restaurantsList.value.sort((a, b) => a.price.compareTo(b.price));

    update(['restaurantsList']);
  }

  List<RestaurantsModels> filterByText(List<RestaurantsModels> list) {
    List<RestaurantsModels> searchList = [];
    searchList = (searchingText.value.isEmpty)
        ? list
        : list
            .where((rest) => rest.name.toLowerCase() == searchingText.value.toLowerCase()
                //  ||
                // rest.name.toLowerCase().contains(
                //       searchText.toLowerCase(),
                //     ),
                )
            .toList();

    return searchList;
  }

  List<RestaurantsModels> filterByPrice(List<RestaurantsModels> list) {
    restaurantsList.value.sort((a, b) => a.price.compareTo(b.price));

    return list.where((rest) => rest.price >= priceRangeValue.value.start.toInt() && rest.price <= priceRangeValue.value.end.toInt()).toList();
  }

  List<RestaurantsModels> filterByType(List<RestaurantsModels> list) {
    return typeFiltterId.value == 100
        ? list
        : list = list
            .where(
              (rest) => rest.type.id == typeFiltterId.value,
            )
            .toList();
  }

  setTypeFiltter(int id) {
    if (id == typeFiltterId.value) {
      typeFiltterId.value = 100;
    } else {
      typeFiltterId.value = id;
    }
    update(['HomeFilter']);
    filter();
  }
}
