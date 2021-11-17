import 'package:tguide/firebase/restaurant_reference.dart';
import 'package:tguide/models/restaurant_model.dart';
import 'package:tguide/view_model/main_view_model.dart';

class MainViewModelImp implements MainViewModel {
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
   return getRestaurantList();
  }

}