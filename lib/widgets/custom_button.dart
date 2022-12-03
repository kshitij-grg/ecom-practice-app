import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String label;
  VoidCallback onPress;
  Color? buttonColor;
  Color textColor;

  CustomButton(
      {required this.label,
      required this.onPress,
      this.buttonColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: buttonColor,
      height: 50,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
