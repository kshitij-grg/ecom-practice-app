import 'package:first_class/constants.dart';
import 'package:flutter/material.dart';

class PlantDetailTile extends StatelessWidget {
  const PlantDetailTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: primaryColor),
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Height",
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                "8.2'",
                style: TextStyle(color: primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
