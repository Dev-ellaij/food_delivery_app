import 'package:flutter/material.dart';
import 'package:food_delivery_app/componets/my_current%20_location.dart';
import 'package:food_delivery_app/componets/my_description_box.dart';
import 'package:food_delivery_app/componets/my_drawer.dart';
import 'package:food_delivery_app/componets/my_food_tile.dart';
import 'package:food_delivery_app/componets/my_sliver_app_bar.dart';
import 'package:food_delivery_app/componets/my_tab_bar.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:food_delivery_app/pages/models/food.dart';
import 'package:food_delivery_app/pages/models/restuarant.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return a list of widgets for the foods in each category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        //get individual food
        itemBuilder: (context, index) {
          final Food = categoryMenu[index];
          //return food tile uI
          return FoodTile(
            food: Food,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodPage(
                          food: Food,
                        ))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const Text("Hello"),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            List<Food> fullMenu =
                restaurant.menu; // Assuming 'menu' exists in Restaurant
            return TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(fullMenu),
            );
          },
        ),
      ),
    );
  }
}
