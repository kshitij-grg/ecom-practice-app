// ignore_for_file: prefer_const_constructors

import 'package:first_class/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'auth/login/login_screen.dart';
import 'auth/register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: const [Color(0xffCAA1FF), Color(0xff8EADFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                "assets/images/logo.png",
                width: 100,
                height: 100,
              ),
              Text(
                "PixelPro Digital",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              CustomButton(
                  label: "Login",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                  label: "Sign up",
                  textColor: Colors.white,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  }),
              Spacer(),
              Text(
                "Continue as a guest",
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
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
