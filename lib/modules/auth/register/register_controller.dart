import 'package:first_class/data/api/auth_api.dart';
import 'package:first_class/modules/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //regex expression for email and password
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<void> register() async {
    // taking the values
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = passwordController.text.trim();

    // validation part
    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      Get.rawSnackbar(
        message: "Invalid email pattern",
      );
      return;
    }

    if (!regex.hasMatch(password)) {
      Get.rawSnackbar(
          message:
              "Enter Valid password!!\nPassword must contain atleast 8 characters with one Small and Capital Letter.");
      return;
    }
    if (confirmPassword != password) {
      Get.rawSnackbar(message: "Passwords didnot match");
      return;
    }

    try {
      var response = await AuthApi.register(email: email, password: password);

      if (response.error != null && response.error == false) {
        Get.rawSnackbar(message: "You are successfully registered");
        Get.off(() => const LoginScreen());
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
    confirmPasswordController.dispose();
    super.onClose();
  }
}
