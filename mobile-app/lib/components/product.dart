import 'package:flutter/material.dart';
import 'package:plaza_ng/pages/productdetail.dart';
import 'package:plaza_ng/components/item_card.dart';

class Product {
  final String name; // Name of the product
  final double price; // Price of the product
  final List<String> imagePath; // Path to the product image
  final String description;

  Product(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.description});
}

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList({super.key, required this.products});

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
                  "Top Selling",
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
            height: 270, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  name: products[index].name,
                  price: products[index].price,
                  imagePath: products[index].imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(product: products[index]),
                      ),
                    );
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
