import 'dart:convert';

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/category/category_reponse.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static Future<List<Categories>> getCategories() async {
    var url = baseUrl + "get-categories";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var categoryResponse = CategoryResponse.fromJson(data).categories;
      return categoryResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }
}
