import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/pages/models/food.dart';
import 'package:food_delivery_app/pages/models/cart_item.dart';
import 'package:collection/collection.dart'; // For ListEquality

class Restaurant extends ChangeNotifier {
  // Food menu
  final List<Food> _menu = [
    // Add your food items here, e.g., Food(name: 'Burger', price: 5.99, imagePath: 'path/to/image'),
  ];

  // User cart
  final List<CartItem> _cart = [];

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // Add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // Check if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      // If the item exists, increment its quantity
      cartItem.quantity++;
    } else {
      // Otherwise, add a new cart item to the cart
      _cart.add(CartItem(
          food: food,
          selectedAddons: selectedAddons)); // Fixed constructor call
    }
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  // Get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate =
        DateTime.now().toIso8601String().split('T').join(' ');
    receipt.writeln(formattedDate);
    receipt.writeln("--------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }

    receipt.writeln("--------");
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // Format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // Format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
