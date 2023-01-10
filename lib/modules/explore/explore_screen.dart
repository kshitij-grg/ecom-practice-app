// ignore_for_file: prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/modules/explore/category_controller.dart';
import 'package:first_class/modules/explore/plant_controller.dart';
import 'package:first_class/modules/explore/widgets/explore_screen_body.dart';
import 'package:first_class/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());
  final plantController = Get.put(PlantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/ashutosh.jpg",
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: primaryColor),
                    child: Icon(Icons.shopping_cart_outlined))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Let's find your \nplants!",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 18,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Search Plant",
                        style: TextStyle(color: Colors.grey.shade400)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => categoryController.isLoading.isTrue &&
                      plantController.isLoading.isTrue
                  ? LoadingView()
                  : ExploreScreenBody(
                      categoryNames: categoryController.categoryList,
                      plants: plantController.plantList,
                    )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
