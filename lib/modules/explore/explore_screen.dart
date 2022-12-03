// ignore_for_file: prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/modules/explore/widgets/explore_screen_body.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

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
              ExploreScreenBody(),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   "Recent Viewed",
              //   style:
              //       TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // SizedBox(
              //   height: 70,
              //   child: ListView.builder(
              //       itemCount: 5,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) => Padding(
              //             padding: const EdgeInsets.only(right: 20),
              //             child: RecentPlantTile(),
              //           )),
              // ),
            ],
          ),
        ));
  }
}
