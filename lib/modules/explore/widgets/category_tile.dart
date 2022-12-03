// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:first_class/constants.dart';
import 'package:first_class/data/models/category/category.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  bool isSelected;
  // String label;
  Category category;
  CategoryTile({required this.isSelected, required this.category});

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: widget.isSelected ? Colors.grey.shade200 : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        widget.category.categoryName,
        style: TextStyle(
            color: widget.isSelected ? primaryColor : Colors.grey,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
