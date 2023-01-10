import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  final SharedPreferences sharedPreferences;
  final isLoggedIn = false.obs;

  AppController(this.sharedPreferences) {
    String? apiKey = sharedPreferences.getString('apiKey');

    if (apiKey == null || apiKey == "") {
      isLoggedIn(false); //isLoggedIn = true;
    } else {
      isLoggedIn(true);
    }

    debugPrintStack(label: apiKey);
  }
}
