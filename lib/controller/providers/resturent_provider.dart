// import 'package:flutter/material.dart';
// import 'package:foodzee/controller/api_service/api_service.dart';
// import 'package:foodzee/model/resturent.dart';

// class RestaurantProvider extends ChangeNotifier {
//   Restaurant? restaurantList;
//   bool isLoading = false;
//   fetchData() async {
//     isLoading = true;
//     notifyListeners();
//     if (restaurantList != null) {
//       restaurantList = await ApiService.getResturentData();
//       notifyListeners();
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
