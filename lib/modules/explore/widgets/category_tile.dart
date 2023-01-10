// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/category/category_reponse.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({required this.isSelected, required this.category});
  bool isSelected;
  Categories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade200 : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        category.name,
        style: TextStyle(
            color: isSelected ? primaryColor : Colors.grey,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
