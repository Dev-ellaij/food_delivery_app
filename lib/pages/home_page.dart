import 'package:flutter/material.dart';
import 'package:food_delivery_app/componets/my_current%20_location.dart';
import 'package:food_delivery_app/componets/my_description_box.dart';
import 'package:food_delivery_app/componets/my_drawer.dart';
import 'package:food_delivery_app/componets/my_sliver_app_bar.dart';
import 'package:food_delivery_app/componets/my_tab_bar.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
                tabController:
                    _tabController), // Use the correct title argument here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // My current location
                const MyCurrentLocation(),
                const Text("Hello"),
                // Description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("First tab item $index"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Second tab item $index"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Third tab item $index"),
            ),
          ],
        ),
      ),
    );
  }
}
