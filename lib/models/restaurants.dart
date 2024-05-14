import 'package:restaurants_app/models/cuisine_type.dart';

class RestaurantsModels {
  final int id;
  final String image, name;
  final int price;
  final CuisinesTypeModels type;

  RestaurantsModels({
    required this.id,
    required this.type,
    required this.price,
    required this.image,
    required this.name,
  });
}
