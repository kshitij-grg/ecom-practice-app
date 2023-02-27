// ignore_for_file: prefer_const_constructors

import 'package:first_class/app_controller.dart';
import 'package:first_class/modules/home_screen.dart';
import 'package:first_class/modules/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  SharedPreferences sharedPreferences;
  MyApp(this.sharedPreferences, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          textTheme: ThemeData().textTheme.apply(fontFamily: 'Poppins')),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AppController(sharedPreferences), permanent: true);
        },
      ),
      home: GetX<AppController>(
          init: AppController(sharedPreferences),
          builder: (_controller) =>
              _controller.isLoggedIn.isFalse ? WelcomeScreen() : HomeScreen()),
    );
  }
}
