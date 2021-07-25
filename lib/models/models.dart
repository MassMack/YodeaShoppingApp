import 'package:flutter/material.dart';

// Grocery item model
class MGrocery {
  final String name;
  final String image;
  final String description;
  final double price;
  final int id;

  MGrocery({this.name, this.image, this.description, this.price,this.id});
}

// Categories item model
class MCategory {
  final String title;
  final String image;
  final Color color;

  MCategory({this.title, this.image, this.color});
}

// Cart item model
class MCartItem {
  final MGrocery item;
  int cout;

  MCartItem({this.item, this.cout});
}

class MGroceries {
  final String title;
  final Color color;
  final String image;

  MGroceries({this.title, this.color, this.image});
}
