import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String label;
  VoidCallback onPress;
  Color? buttonColor;
  Color textColor;
  double? width;
  Color? borderColor;
  bool? iconVisibility;

  CustomButton(
      {required this.label,
      required this.onPress,
      this.buttonColor,
      this.width,
      this.borderColor,
      this.iconVisibility,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: onPress,
      color: buttonColor,
      height: 50,
      minWidth: (width == null) ? _width : width,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: iconVisibility ?? false,
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          Visibility(
            visible: iconVisibility ?? false,
            child: const SizedBox(
              width: 10,
            ),
          ),
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
