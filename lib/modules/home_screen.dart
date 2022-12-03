// ignore_for_file: prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/modules/cart/cart_screen.dart';
import 'package:first_class/modules/explore/explore_screen.dart';
import 'package:first_class/modules/history/history_screen.dart';
import 'package:first_class/modules/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    ExploreScreen(),
    ProfileScreen(),
    CartScreen(),
    HistoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        unselectedItemColor: primaryColor,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded), label: "History"),
        ],
      ),
    );
  }
}
