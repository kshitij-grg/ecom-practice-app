import 'dart:convert';

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/auth/login_response.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<LoginResponse> register(
      {required String email, required String password}) async {
    const url = baseUrl + "register";

    Map<String, String> requestBody = <String, String>{
      "email": email,
      "password": password
    };

    final response =
        await http.post(Uri.parse(url), body: requestBody, headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }
}