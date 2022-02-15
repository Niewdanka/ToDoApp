import 'package:flutter/material.dart';

class Category {
  final String name;
  final int color;
  final int icon;

  Category({
    required this.name,
    required this.color,
    required this.icon,
  });
}

List<Category> categories = [
  Category(
    name: 'food',
    color: Colors.red[800]!.value,
    icon: Icons.restaurant.codePoint,
  ),
  Category(
    name: 'work',
    color: Colors.yellow[800]!.value,
    icon: Icons.work_outline.codePoint,
  ),
  Category(
    name: 'home',
    color: Colors.blue[900]!.value,
    icon: Icons.home_filled.codePoint,
  ),
  Category(
    name: 'school',
    color: Colors.green[800]!.value,
    icon: Icons.school_rounded.codePoint,
  ),
  Category(
    name: 'gym',
    color: Colors.pink[400]!.value,
    icon: Icons.fitness_center.codePoint,
  ),
  Category(
    name: 'other',
    color: Colors.grey.value,
    icon: Icons.settings.codePoint,
  ),
];
