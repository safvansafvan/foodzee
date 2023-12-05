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
  late final double dishCalories;
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
    dishCalories = json['dish_calories'] ?? 0.0222;
    dishDescription = json['dish_description'] ?? 'unknown';
    dishAvailability = json['dish_Availability'] ?? false;
    dishType = json['dish_Type'] ?? 0;
    nexturl = json['nexturl'] ?? 'unknown';
  }
  static List<CategoryModel> extractCategoryDishes(List<dynamic> menuList) {
    List<CategoryModel> categoryDishes = [];
    for (var item in menuList) {
      List<dynamic> categoryDishesList = item['category_dishes'];
      categoryDishes.addAll(categoryDishesList
          .map((categoryDish) => CategoryModel.fromJson(categoryDish))
          .toList());
    }
    return categoryDishes;
  }
}
