import 'package:first_class/data/models/category/category.dart';
import 'package:first_class/data/models/product/product.dart';
import 'package:first_class/modules/explore/widgets/plant_tile.dart';
import 'package:flutter/material.dart';

import 'category_tile.dart';

class ExploreScreenBody extends StatefulWidget {
  @override
  State<ExploreScreenBody> createState() => _ExploreScreenBodyState();
}

class _ExploreScreenBodyState extends State<ExploreScreenBody> {
  int _selectedCategoryIndex = 1; //to denote which category has been selected

  // List<String> categoryNames = ['Recommend', 'Top', 'Indoor', 'Outdoor'];

  List<Category> categoryNames = [
    Category(categoryId: 1, categoryName: "All"),
    Category(categoryId: 2, categoryName: "Top"),
    Category(categoryId: 3, categoryName: "Indoor"),
    Category(categoryId: 4, categoryName: "Outdoor"),
  ];

  List<Product> productNames = [
    Product(
        productId: 1,
        name: "Peace Lily",
        image: "assets/images/plant-1.png",
        price: 310,
        desc:
            "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
        quantity: 5,
        height: "8.2",
        width: "14",
        humidity: "62%",
        categoryId: 2),
    Product(
        productId: 2,
        name: "Schefflera",
        image: "assets/images/plant-1.png",
        price: 250,
        desc:
            "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
        quantity: 5,
        height: "8.2",
        width: "14",
        humidity: "62%",
        categoryId: 2),
    Product(
        productId: 3,
        name: "Monsterra",
        image: "assets/images/plant-1.png",
        price: 310,
        desc:
            "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
        quantity: 5,
        height: "8.2",
        width: "14",
        humidity: "62%",
        categoryId: 3),
    Product(
        productId: 4,
        name: "Peace Lily",
        image: "assets/images/plant-1.png",
        price: 310,
        desc:
            "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
        quantity: 5,
        height: "8.2",
        width: "14",
        humidity: "62%",
        categoryId: 3),
    Product(
        productId: 5,
        name: "Peace Lily",
        image: "assets/images/plant-1.png",
        price: 310,
        desc:
            "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
        quantity: 5,
        height: "8.2",
        width: "14",
        humidity: "62%",
        categoryId: 4),
  ];

  Widget getPlants() {
    List<Product> categoryPlants = [];

    if (_selectedCategoryIndex == 1) {
      categoryPlants = productNames;
    } else {
      for (Product product in productNames) {
        if (_selectedCategoryIndex == product.categoryId) {
          categoryPlants.add(product);
        }
      }
    }

    // return ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: categoryPlants.length,
    //     itemBuilder: (context, index) => Padding(
    //           padding: const EdgeInsets.only(right: 20),
    //           child: PlantTile(product: categoryPlants[index]),
    //         ));

    return GridView.builder(
      itemCount: categoryPlants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) =>
          PlantTile(product: categoryPlants[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // this one is for the category names
          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryNames.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = categoryNames[index].categoryId;
                    });
                  },
                  child: CategoryTile(
                    isSelected: _selectedCategoryIndex ==
                        categoryNames[index].categoryId,
                    category: categoryNames[index],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // this one is for all the plants
          Expanded(child: getPlants()),
        ],
      ),
    );
  }
}
