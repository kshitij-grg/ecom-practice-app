import 'package:first_class/constants.dart';
import 'package:flutter/material.dart';

class SinglePlantTile extends StatelessWidget {
  const SinglePlantTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: _width,
                  color: const Color(0xffC1DFCB).withOpacity(.5),
                  child: Image.asset(
                    "assets/images/plant-1.png",
                    fit: BoxFit.contain,
                    width: 400,
                    height: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            color: primaryColor,
                          )),
                      Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: primaryColor),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
