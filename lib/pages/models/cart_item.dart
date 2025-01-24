import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons; // Fixed the typo in 'list<Addon>'
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    // Fixed calculation logic for totalPrice
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity; // Corrected '=' to '*'
  }
}
