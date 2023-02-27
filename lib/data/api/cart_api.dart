import 'dart:convert';
import 'package:first_class/constants.dart';
import 'package:first_class/data/models/auth/login_response.dart';
import 'package:first_class/data/models/cart/cart_response.dart';
import 'package:http/http.dart' as http;

class CartApi {
  static Future<LoginResponse> add(
      {required String apiKey,
      required int plantId,
      required String quantity}) async {
    ///link to our api
    const url = baseUrl + "cart";

    //request body
    Map<String, String> requestBody = <String, String>{
      "plant_id": plantId.toString(),
      "quantity": quantity
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "api_key": apiKey,
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    } else if (response.statusCode == 400) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<List<Plants>> get(apiKey) async {
    const url = baseUrl + "cart";

    final response = await http.get(Uri.parse(url), headers: {
      "api_key": apiKey,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CartResponse.fromJson(data).plants;
    } else if (response.statusCode == 400) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }
}
