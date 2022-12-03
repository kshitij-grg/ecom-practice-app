// ignore_for_file: prefer_const_constructors

import 'package:first_class/modules/login_screen.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  String label;
  TextInputAction textInputAction;
  TextInputType textInputType;

  PasswordTextField(
      {required this.label,
      required this.textInputAction,
      required this.textInputType});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              child: Icon(
                isPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          label: Text(
            widget.label,
            style: TextStyle(color: Colors.white),
          )),
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
    );
  }
}