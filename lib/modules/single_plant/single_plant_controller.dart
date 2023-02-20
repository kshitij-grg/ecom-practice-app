import 'package:first_class/app_controller.dart';
import 'package:first_class/modules/cart/cart_controller.dart';
import 'package:get/get.dart';

class SinglePlantController extends GetxController {
  final count = 1.obs;
  String apiKey =
      Get.find<AppController>().sharedPreferences.getString('apiKey') ?? '';

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  Future<void> addToCart(int plantId) async {
    Get.find<CartController>().addToCart(plantId, count.value.toString());
  }
}
