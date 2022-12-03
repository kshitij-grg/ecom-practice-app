import 'package:first_class/constants.dart';
import 'package:flutter/material.dart';

class RecentPlantTile extends StatelessWidget {
  const RecentPlantTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/plant-1.png",
              fit: BoxFit.contain,
              width: 50,
              height: 50,
            )),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Calathea",
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Its spines don't grow",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
