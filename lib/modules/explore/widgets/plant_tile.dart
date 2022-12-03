// ignore_for_file: prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/product/product.dart';
import 'package:flutter/material.dart';

class PlantTile extends StatelessWidget {
  Product product;
  PlantTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 220,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor.withOpacity(.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Indoor", style: TextStyle(color: primaryColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      "Rs. ${product.price}",
                      style: TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          left: 10,
          child: Image.asset(
            product.image,
            fit: BoxFit.contain,
            height: 200,
          ),
        ),
      ]),
    );
  }
}
