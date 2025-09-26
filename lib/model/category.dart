import 'package:flutter/material.dart';

class Category {
  //initialise these objects and set these properties
  //default color is provided

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orangeAccent,
  });

  final String id;
  final String title;
  final Color color;
}
