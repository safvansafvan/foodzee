import 'dart:convert';
import 'dart:developer';
import 'package:foodzee/controller/strings.dart';
import 'package:foodzee/model/resturent.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<CategoryModel>> getCategoryDishes() async {
    final String url = Urls.url;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        List<dynamic> newsList = json[0]['table_menu_list'][0];
        log(newsList.toString());
        List<CategoryModel> newsData =
            newsList.map((item) => CategoryModel.fromJson(item)).toList();

        return newsData;
      } else {
        log('error fe'.toString());
        throw Exception("Error fetching financial news:");
      }
    } catch (error) {
      log(error.toString());
      throw Exception("Error fetching financial news: $error");
    }
  }
}
