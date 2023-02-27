import 'package:first_class/data/api/plant_api.dart';
import 'package:first_class/data/models/plant/plant_response.dart';
import 'package:get/get.dart';

class PlantController extends GetxController {
  List<Plants> plantList = [];
  String errorMessage = "";
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPlants();
  }

  Future<void> getPlants() async {
    isLoading(true); //isLoading = true;
    try {
      plantList = await PlantApi.getPlants();
      isLoading(false);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load plant";
      }
      errorMessage = e.toString();
    }
  }
}
