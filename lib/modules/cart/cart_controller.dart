import 'package:first_class/app_controller.dart';
import 'package:first_class/constants.dart';
import 'package:first_class/data/api/cart_api.dart';
import 'package:first_class/data/models/cart/cart_response.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  String apiKey = Get.find<AppController>().getToken();
  List<Plants> plantsCart = [];
  final isLoading = false.obs;
  final total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCartFood();
  }

  Future<void> getCartFood() async {
    List<Plants> tempCart = await CartApi.get(apiKey);
    plantsCart.addAll(tempCart);
    calculateTotalCost();
    update();
  }

  void calculateTotalCost() {
    double newTotal = 0;
    for (var cartItem in plantsCart) {
      newTotal +=
          (double.parse(cartItem.cartQuantity) * cartItem.price.toDouble());
    }
    total(newTotal);
  }

  Future<void> updatePlantCart() async {
    plantsCart = await CartApi.get(apiKey);
    calculateTotalCost();
  }

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
    calculateTotalCost();
    updatePlantCart();
    update();
  }
}
