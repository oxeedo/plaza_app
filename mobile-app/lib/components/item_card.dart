import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final double price;
  final List<String> imagePath;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath.isNotEmpty
                      ? imagePath[0]
                      : 'assets/placeholder.png',
                  fit: BoxFit.fill,
                  height: 150, // Reduced height
                  width: 150, // Fill the width
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4.0), // Reduced vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 100, // Set the desired width
                  height: 30, // Set the desired height
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, // Remove default padding
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
