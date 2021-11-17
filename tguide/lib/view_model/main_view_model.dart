import 'package:tguide/models/restaurant_model.dart';

abstract class MainViewModel {
  Future<List<RestaurantModel>> displayRestaurantList();

}

