import 'package:flutter/material.dart';
import 'meal.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  Category({
    required this.id,
    required this.title,
    required this.color,
  });
}

Category c1 = Category(id: "id", title: "title", color: Colors.amber);
