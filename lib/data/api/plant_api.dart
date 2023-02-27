import 'dart:convert';

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/plant/plant_response.dart';
import 'package:http/http.dart' as http;

class PlantApi {
  static Future<List<Plants>> getPlants() async {
    var url = baseUrl + "get-all-plants";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var plantResponse = PlantResponse.fromJson(data).plants;
      return plantResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }
}
