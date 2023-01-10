// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_class/constants.dart';
import 'package:first_class/data/models/plant/plant.dart';
import 'package:first_class/modules/single_plant/single_plant_screen.dart';
import 'package:first_class/widgets/loading_view.dart';
import 'package:flutter/material.dart';

class PlantTile extends StatelessWidget {
  Plants plant;
  PlantTile({required this.plant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SinglePlantTile(
                      plant: plant,
                    )));
      },
      child: SizedBox(
        height: 250, //decreased the value to some extent here
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 220,
            padding: EdgeInsets.all(10), //decrease the padding to 10 from 15
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor.withOpacity(.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Indoor",
                    style: TextStyle(
                      color: primaryColor, fontSize: 12, //font size decreased
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      plant.name,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13, //font size decreased
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2), //decrease the padding here also
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Text(
                        "Rs. ${plant.price}",
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
            child: CachedNetworkImage(
              imageUrl: plant.image,
              height: 200,
              fit: BoxFit.contain,
              placeholder: ((context, url) => LoadingView(
                    size: 50,
                  )),
              errorWidget: (context, url, error) => Icon(Icons.error_outline),
            ),
          ),
        ]),
      ),
    );
  }
}
