import 'package:flutter/material.dart';

// Category model
class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

// Category widget
class CategoriesList extends StatelessWidget {
  final List<Category> categories;

  const CategoriesList({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
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
          ),),
          SizedBox(height: 10),
          SizedBox(
            height: 150, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30, // Adjust radius for size
                        backgroundImage:
                            AssetImage(categories[index].imagePath),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80, // Set a specific width for the text
                        alignment:
                            Alignment.center, // Center the text horizontally
                        child: Text(
                          categories[index].name,
                          maxLines: 2, // Limit to a maximum of 2 lines
                          overflow: TextOverflow
                              .ellipsis, // Choose how to handle overflow
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
