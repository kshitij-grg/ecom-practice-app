import 'package:first_class/data/api/category_api.dart';
import 'package:first_class/data/models/category/category_reponse.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<Categories> categoryList = [];
  String errorMessage = "";
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    // Get.rawSnackbar(message: categoryList.toString());
  }

  Future<void> getCategories() async {
    isLoading(true); //isLoading = true;
    try {
      categoryList = await CategoryApi.getCategories();
      isLoading(false);
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = "Failed to load category";
      }
      errorMessage = e.toString();
    }
  }
}
