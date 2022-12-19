// ignore_for_file: prefer_const_constructors

import 'package:first_class/modules/auth/register/register_controller.dart';
import 'package:first_class/widgets/custom_button.dart';
import 'package:first_class/widgets/input_text_field.dart';
import 'package:first_class/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffCAA1FF), Color(0xff8EADFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "Create Account,",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
              const Text(
                "to get started now!",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 40,
              ),
              InputTextField(
                label: "Email Address",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              PasswordTextField(
                label: "Password",
                showIcon: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword,
                controller: controller.passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              PasswordTextField(
                showIcon: false,
                label: "Confirm Password",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                controller: controller.confirmPasswordController,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  label: "Sign up",
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  onPress: controller.register),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      " Login Now",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
