import 'package:flutter/foundation.dart';

class Food {
  final String name; // Cheese burger
  final String description; // Burger full of cheese
  final String imagepath; // lib/images/cheese_burger.png
  final double price; // 4.99
  final FoodCategory category; // burger
  List<Addon> availableAddons; // [extra cheese, ...]

  Food({
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// Food categories
enum FoodCategory {
  burgers,
  salads,
  sides, // Fixed typo: "Slides" should be "sides"
  desserts,
  drinks,
}

// Food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
