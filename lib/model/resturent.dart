// class CategoryModel {
//   final String? dishId;
//   final String? dishName;
//   final double? dishPrice;
//   final String? dishImage;
//   final String? dishCurrency;
//   final int? dishCalories;
//   final String? dishDescription;
//   final bool? dishAvailability;
//   final int? dishType;
//   final String? nextUrl;
//   final List<AddonCategory>? addonCat;

//   CategoryModel({
//     this.dishId,
//     this.dishName,
//     this.dishPrice,
//     this.dishImage,
//     this.dishCurrency,
//     this.dishCalories,
//     this.dishDescription,
//     this.dishAvailability,
//     this.dishType,
//     this.nextUrl,
//     this.addonCat,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       dishId: json['dish_id'],
//       dishName: json['dish_name'],
//       dishPrice: json['dish_price']?.toDouble(),
//       dishImage: json['dish_image'],
//       dishCurrency: json['dish_currency'],
//       dishCalories: json['dish_calories'],
//       dishDescription: json['dish_description'],
//       dishAvailability: json['dish_Availability'],
//       dishType: json['dish_Type'],
//       nextUrl: json['nexturl'],
//       addonCat: (json['addonCat'] as List?)
//           ?.map((addonCatJson) => AddonCategory.fromJson(addonCatJson))
//           .toList(),
//     );
//   }
// }

// class AddonCategory {
//   final String? addonCategory;
//   final int? addonCategoryId;
//   final int? addonSelection;
//   final String? nextUrl;
//   final List<Addon>? addons;

//   AddonCategory({
//     this.addonCategory,
//     this.addonCategoryId,
//     this.addonSelection,
//     this.nextUrl,
//     this.addons,
//   });

//   factory AddonCategory.fromJson(Map<String, dynamic> json) {
//     return AddonCategory(
//       addonCategory: json['addon_category'],
//       addonCategoryId: json['addon_category_id'],
//       addonSelection: json['addon_selection'],
//       nextUrl: json['nexturl'],
//       addons: (json['addons'] as List?)
//           ?.map((addonJson) => Addon.fromJson(addonJson))
//           .toList(),
//     );
//   }
// }

// class Addon {
//   final int? dishId;
//   final String? dishName;
//   final double? dishPrice;
//   final String? dishImage;
//   final String? dishCurrency;
//   final int? dishCalories;
//   final String? dishDescription;
//   final bool? dishAvailability;
//   final int? dishType;

//   Addon({
//     this.dishId,
//     this.dishName,
//     this.dishPrice,
//     this.dishImage,
//     this.dishCurrency,
//     this.dishCalories,
//     this.dishDescription,
//     this.dishAvailability,
//     this.dishType,
//   });

//   factory Addon.fromJson(Map<String, dynamic> json) {
//     return Addon(
//       dishId: json['dish_id'],
//       dishName: json['dish_name'],
//       dishPrice: json['dish_price']?.toDouble(),
//       dishImage: json['dish_image'],
//       dishCurrency: json['dish_currency'],
//       dishCalories: json['dish_calories'],
//       dishDescription: json['dish_description'],
//       dishAvailability: json['dish_Availability'],
//       dishType: json['dish_Type'],
//     );
//   }
// }

class CategoryModel {
  CategoryModel({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
    required this.nexturl,
  });
  late final String dishId;
  late final String dishName;
  late final double dishPrice;
  late final String dishImage;
  late final String dishCurrency;
  late final int dishCalories;
  late final String dishDescription;
  late final bool dishAvailability;
  late final int dishType;
  late final String nexturl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    dishId = json['dish_id'] ?? 'unknown';
    dishName = json['dish_name'] ?? 'unknown';
    dishPrice = json['dish_price'] ?? 0.0;
    dishImage = json['dish_image'] ?? 'unknown';
    dishCurrency = json['dish_currency'] ?? 'unknown';
    dishCalories = json['dish_calories'] ?? 0;
    dishDescription = json['dish_description'] ?? 'unknown';
    dishAvailability = json['dish_Availability'] ?? false;
    dishType = json['dish_Type'] ?? 0;
    nexturl = json['nexturl'] ?? 'unknown';
  }
}
