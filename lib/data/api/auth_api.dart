import 'dart:convert';

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/auth/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app_controller.dart';

class AuthApi {
  static Future<LoginResponse> register(
      {required String email, required String password}) async {
    ///hamle esma chai link deko ho
    const url = baseUrl + "register";

// yo chai request body banako ho
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

  static Future<LoginResponse> login(
      {required String email, required String password}) async {
    ///hamle esma chai link deko ho
    const url = baseUrl + "login";

// yo chai request body banako ho
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
      //we should set the api key here
      await Get.find<AppController>()
          .sharedPreferences
          .setString("apiKey", loginResponse.apiKey ?? '');
      return loginResponse;
    } else if (response.statusCode == 401) {
      throw Exception('Some of the fields are missing');
    } else {
      throw Exception("Something went wrong");
    }
  }
}
