// ignore_for_file: prefer_const_constructors

import 'package:first_class/modules/login_screen.dart';
import 'package:first_class/modules/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          textTheme: ThemeData().textTheme.apply(fontFamily: 'Poppins')),
      home: WelcomeScreen(),
    );
  }
}
