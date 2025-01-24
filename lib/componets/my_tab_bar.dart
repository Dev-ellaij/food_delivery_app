import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  // Build category tabs
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last, // Get the name of the enum
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).textTheme.bodyLarge?.color,
        unselectedLabelColor: Theme.of(context).hintColor,
      ),
    );
  }
}
