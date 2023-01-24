import 'package:first_class/constants.dart';
import 'package:flutter/material.dart';

class PlantDetailTile extends StatelessWidget {
  String label, value;
  IconData icon;

  PlantDetailTile(
      {required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: primaryColor),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.black54),
              ),
              Text(
                "$value'",
                style: const TextStyle(color: primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
