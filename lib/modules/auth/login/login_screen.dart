// ignore_for_file: prefer_const_constructors

import 'package:first_class/modules/auth/login/login_controller.dart';
import 'package:first_class/widgets/input_text_field.dart';
import 'package:get/get.dart';

import '../../../widgets/password_text_field.dart';
import '../register/register_screen.dart';
import 'package:first_class/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                "Welcome,",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
              const Text(
                "Glad to see you!",
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
                showIcon: true,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                controller: controller.passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  label: "Login",
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  onPress: controller.login),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      " Sign Up Now",
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
