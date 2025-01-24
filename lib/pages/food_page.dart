import 'package:flutter/material.dart';
import 'package:food_delivery_app/componets/my_button.dart';
import 'package:food_delivery_app/pages/models/restuarant.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/pages/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late Map<Addon, bool> selectedAddons;

  @override
  void initState() {
    super.initState();
    // Initialize selectedAddons with default values
    selectedAddons = {
      for (var addon in widget.food.availableAddons) addon: false
    };
  }

  // Method to add food with selected add-ons to the cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    List<Addon> currentlySelectedAddons = selectedAddons.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Food Details'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Food Image
                Image.asset(widget.food.imagepath, fit: BoxFit.cover),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food Name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Food Price
                      Text(
                        '\$${widget.food.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Food Description
                      Text(widget.food.description),
                      const SizedBox(height: 20),

                      // Add-ons Section
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle:
                                  Text('\$${addon.price.toStringAsFixed(2)}'),
                              value: selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedAddons[addon] = value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Add to Cart Button
                      MyButton(
                        onTap: () => addToCart(widget.food, selectedAddons),
                        text: "Add to Cart",
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Back Button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
