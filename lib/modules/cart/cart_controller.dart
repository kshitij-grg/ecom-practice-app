import 'package:first_class/app_controller.dart';
import 'package:first_class/constants.dart';
import 'package:first_class/data/api/cart_api.dart';
import 'package:first_class/data/models/plant/plant.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  String apiKey = Get.find<AppController>().getToken();
  List<Plants> plantsCart = [];
  final isLoading = false.obs;

  Future<void> addToCart(int plantId, String quantity) async {
    isLoading(true);

    try {
      if (plantsCart
              .firstWhereOrNull((element) => element.plantId == plantId) ==
          null) {
        isLoading(false);

        var response = await CartApi.add(
            apiKey: apiKey, plantId: plantId, quantity: quantity);

        if (response.error == false) {
          Get.rawSnackbar(message: "Added to Cart");
        } else {
          Get.rawSnackbar(
              backgroundColor: primaryColor,
              message: "An Error Occured while Adding Plant to Cart");
        }
      } else {
        Get.rawSnackbar(message: "Already on Cart");
      }
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }
}
