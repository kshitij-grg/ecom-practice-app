// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  String label;
  TextInputAction textInputAction;
  TextInputType textInputType;
  bool showIcon;
  TextEditingController controller;

  PasswordTextField(
      {required this.label,
      required this.controller,
      required this.textInputAction,
      required this.showIcon,
      required this.textInputType});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              child: Visibility(
                visible: widget.showIcon,
                child: Icon(
                  isPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
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
