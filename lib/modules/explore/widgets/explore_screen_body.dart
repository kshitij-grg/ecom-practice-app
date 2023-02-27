import 'package:first_class/data/models/category/category_reponse.dart';
import 'package:first_class/data/models/plant/plant_response.dart';
import 'package:first_class/modules/explore/widgets/plant_tile.dart';
import 'package:flutter/material.dart';

import 'category_tile.dart';

class ExploreScreenBody extends StatefulWidget {
  ExploreScreenBody({required this.categoryNames, required this.plants});

  List<Categories> categoryNames;
  List<Plants> plants;

  @override
  State<ExploreScreenBody> createState() => _ExploreScreenBodyState();
}

class _ExploreScreenBodyState extends State<ExploreScreenBody> {
  int _selectedCategoryIndex = 1; //to denote which category has been selected

  // List<Product> productNames = [
  //   Product(
  //       productId: 1,
  //       name: "Peace Lily",
  //       image: "assets/images/plant-1.png",
  //       price: 310,
  //       desc:
  //           "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
  //       quantity: 5,
  //       height: "8.2",
  //       width: "14",
  //       humidity: "62%",
  //       categoryId: 2),
  //   Product(
  //       productId: 2,
  //       name: "Schefflera",
  //       image: "assets/images/plant-1.png",
  //       price: 250,
  //       desc:
  //           "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
  //       quantity: 5,
  //       height: "8.2",
  //       width: "14",
  //       humidity: "62%",
  //       categoryId: 2),
  //   Product(
  //       productId: 3,
  //       name: "Monsterra",
  //       image: "assets/images/plant-1.png",
  //       price: 310,
  //       desc:
  //           "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
  //       quantity: 5,
  //       height: "8.2",
  //       width: "14",
  //       humidity: "62%",
  //       categoryId: 3),
  //   Product(
  //       productId: 4,
  //       name: "Peace Lily",
  //       image: "assets/images/plant-1.png",
  //       price: 310,
  //       desc:
  //           "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
  //       quantity: 5,
  //       height: "8.2",
  //       width: "14",
  //       humidity: "62%",
  //       categoryId: 3),
  //   Product(
  //       productId: 5,
  //       name: "Peace Lily",
  //       image: "assets/images/plant-1.png",
  //       price: 310,
  //       desc:
  //           "Peace lilies are tropical, evergreen plants that thrive on the forest floor, where they receive dappled sunlight and consistent moisture and humidity.",
  //       quantity: 5,
  //       height: "8.2",
  //       width: "14",
  //       humidity: "62%",
  //       categoryId: 4),
  // ];

  Widget getPlants() {
    List<Plants> categoryPlants = [];

    if (_selectedCategoryIndex == 1) {
      categoryPlants = widget.plants;
    } else {
      for (Plants product in widget.plants) {
        if (_selectedCategoryIndex == product.categoryId) {
          categoryPlants.add(product);
        }
      }
    }

    return GridView.builder(
      itemCount: categoryPlants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent:
            250, //place the same value as we did in the plant tile widget
      ),
      itemBuilder: (context, index) => PlantTile(
        plant: categoryPlants[index],
      ),
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
              itemCount: widget.categoryNames.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex =
                          widget.categoryNames[index].categoryId;
                    });
                  },
                  child: CategoryTile(
                    isSelected: _selectedCategoryIndex ==
                        widget.categoryNames[index].categoryId,
                    category: widget.categoryNames[index],
                  ),
                ),
              ),
            ),
          ),
          // this one is for all the plants
          Expanded(child: getPlants()),
        ],
      ),
    );
  }
}
