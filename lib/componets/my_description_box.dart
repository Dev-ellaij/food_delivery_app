import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Define primary and secondary text styles
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery fee section
          Column(
            children: [
              Text('\$1.99', style: myPrimaryTextStyle),
              Text('Delivery Fee', style: mySecondaryTextStyle),
            ],
          ),

          // Delivery time section
          Column(
            children: [
              Text('15-30 min', style: myPrimaryTextStyle),
              Text('Delivery Time', style: mySecondaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
