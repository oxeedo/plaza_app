import 'package:flutter/material.dart';
import 'package:plaza_ng/components/item_card.dart';

class NewItem {
  final String name; // Name of the new item
  final double price; // Price of the new item
  final List<String> imagePath; // Path to the new item image

  NewItem({required this.name, required this.price, required this.imagePath});
}

class NewItemList extends StatelessWidget {
  final List<NewItem> newitems;

  const NewItemList({super.key, required this.newitems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Items",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "See All",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 270,

            // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newitems.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  name: newitems[index].name,
                  price: newitems[index].price,
                  imagePath: newitems[index].imagePath,
                  onTap: () {
                    // Handle item tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
