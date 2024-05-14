import 'dart:math';

import 'package:restaurants_app/core/utilities/enums.dart';

import '../../models/cuisine_type.dart';
import '../../models/restaurants.dart';
import '../config/assets_images_path.dart';

Random random = Random();

class Utilities {
  static List<RestaurantsModels> restaurantsList = List.generate(
    100,
    (index) => RestaurantsModels(
      id: index,
      name: "Restaurant-${index + 1}",
      image: AssetImagePath.restaurant,
      price: Utilities.getRandomPrice(),
      type: Utilities.getRandomCuisinesTypeModels(),
    ),
  );
  static List<CuisinesTypeModels> suisinesTypeList = <CuisinesTypeModels>[
    CuisinesTypeModels(id: 0, type: CuisinesType.italian),
    CuisinesTypeModels(id: 1, type: CuisinesType.french),
    CuisinesTypeModels(id: 2, type: CuisinesType.japanese),
    CuisinesTypeModels(id: 3, type: CuisinesType.oriental),
    CuisinesTypeModels(id: 5, type: CuisinesType.chinese),
  ];

  static CuisinesTypeModels getRandomCuisinesTypeModels() {
    int randomIndex = random.nextInt(suisinesTypeList.length);
    CuisinesTypeModels randomElement = suisinesTypeList[randomIndex];
    return randomElement;
  }

  static int getRandomPrice() {
    int minPrice = 100;
    int maxPrice = 1000;
    int randomPrice = minPrice + random.nextInt(maxPrice - minPrice + 1);
    return randomPrice;
  }

  static String setCuisinesTypeTitle(CuisinesType type) {
    switch (type) {
      case CuisinesType.italian:
        return "Italian Cuisine";
      case CuisinesType.french:
        return "French Cuisine";
      case CuisinesType.japanese:
        return "Japanese Cuisine";
      case CuisinesType.oriental:
        return "Oriental Cuisine";
      default:
        return "Chinese Cuisine";
    }
  }
}
