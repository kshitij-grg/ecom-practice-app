import 'package:first_class/app_controller.dart';
import 'package:first_class/data/api/auth_api.dart';
import 'package:first_class/modules/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.find<AppController>();

  Future login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // validation part
    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    try {
      var response = await AuthApi.login(email: email, password: password);

      if (response.error != null && response.error == false) {
        Get.rawSnackbar(message: "You have successfully Logged In");
        controller.isLoggedIn(true);
        Get.offAll(() => const HomeScreen());
      } else {
        Get.rawSnackbar(message: response.message);
      }
    } catch (e) {
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
