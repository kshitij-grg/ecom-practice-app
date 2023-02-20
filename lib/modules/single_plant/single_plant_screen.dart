import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_class/constants.dart';
import 'package:first_class/data/models/plant/plant.dart';
import 'package:first_class/modules/single_plant/single_plant_controller.dart';
import 'package:first_class/modules/single_plant/widgets/plant_detail_tile.dart';
import 'package:first_class/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loading_view.dart';

class SinglePlantTile extends StatelessWidget {
  Plants plant;

  SinglePlantTile({required this.plant});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SinglePlantController());
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // upper part of the screen
                  Container(
                    width: _width,
                    height: _height / 2,
                    color: const Color(0xffC1DFCB).withOpacity(.5),
                    child: CachedNetworkImage(
                      imageUrl: plant.image,
                      height: 400,
                      width: 400,
                      fit: BoxFit.contain,
                      placeholder: ((context, url) => LoadingView()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: Get.back,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: const Icon(Icons.chevron_left,
                                  color: primaryColor, size: 20)),
                        ),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: primaryColor),
                            child: const Icon(Icons.favorite_outline,
                                color: Colors.white, size: 20)),
                      ],
                    ),
                  ),

                  // lower part of the screen
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: _width,
                      height: _height / 2,
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plant.name,
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Rs. ${plant.price}",
                                    style: const TextStyle(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: controller.decrement,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        // size: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Obx(
                                      () => Text(
                                        "${controller.count.value}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: controller.increment,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        // size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "About",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            plant.description,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              PlantDetailTile(
                                icon: Icons.arrow_upward,
                                label: "Height",
                                value: plant.height,
                              ),
                              PlantDetailTile(
                                icon: Icons.arrow_downward,
                                label: "Humidity",
                                value: plant.humidity,
                              ),
                              PlantDetailTile(
                                icon: Icons.arrow_forward_sharp,
                                label: "Thickness",
                                value: plant.thickness,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: primaryColor,
                                    size: 20,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                label: "BUY NOW",
                                onPress: () {
                                  controller.addToCart(plant.plantId);
                                },
                                textColor: Colors.white,
                                buttonColor: primaryColor,
                                borderColor: primaryColor,
                                iconVisibility: true,
                                width: MediaQuery.of(context).size.width * .7,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
