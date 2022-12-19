import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  String label;
  TextInputAction textInputAction;
  TextInputType textInputType;
  TextEditingController controller;

  InputTextField(
      {required this.label,
      required this.controller,
      required this.textInputAction,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          )),
      textInputAction: textInputAction,
      keyboardType: textInputType,
    );
  }
}
