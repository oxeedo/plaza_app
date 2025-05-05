import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza_ng/components/categories_list.dart';
import 'package:plaza_ng/components/bloc/MyDataModel.dart';
import 'package:plaza_ng/components/product.dart'; // Assuming this is the Product class
import 'package:plaza_ng/components/new_item.dart'; // Assuming this is the NewItem class

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
// Sample selling products
    final List<Product> products = [
      Product(
        name: "Men's Harrington Jacket",
        price: 148.00,
        description: "A high-quality phones from Xiaomi.",
        imagePath: [
          'assets/images/jacket3.png',
          'assets/images/jacket3.png',
          'assets/images/jacket3.png'
        ],
      ),
      Product(
        name: "Max Cirro Men's Slides",
        price: 55.00,
        description: "A high-quality phones from Xiaomi.",
        imagePath: [
          'assets/images/max.png',
          'assets/images/max.png',
          'assets/images/max.png'
        ],
      ),
      Product(
        name: "Men's Harrington Jacket",
        price: 665.00,
        description: "A high-quality phones from Xiaomi.",
        imagePath: [
          'assets/images/jacket3.png',
          'assets/images/jacket3.png',
          'assets/images/jacket3.png'
        ],
      ),
      Product(
          name: "Max Cirro Men's Slides",
          price: 250.00,
          description: "A high-quality phones from Xiaomi.",
          imagePath: [
            'assets/images/max.png',
            'assets/images/max.png',
            'assets/images/max.png',
          ]),
      Product(
        name: "Max Cirro Men's Slides",
        price: 150.00,
        description: "A high-quality phones from Xiaomi.",
        imagePath: [
          'assets/images/max.png',
          'assets/images/max.png',
          'assets/images/max.png'
        ],
      ),
    ];
// Sample new items
    final List<NewItem> newitems = [
      NewItem(
          name: "Men's Harrington Jacket",
          price: 148.00,
          imagePath: ['assets/images/jacket.png']),
      NewItem(
          name: "Max Cirro Men's Slides",
          price: 55.00,
          imagePath: ['assets/images/jacket2.png']),
      NewItem(
          name: "Men's Harrington Jacket",
          price: 665.00,
          imagePath: ['assets/images/jacket3.png']),
      NewItem(
          name: "Max Cirro Men's Slides",
          price: 250.00,
          imagePath: ['assets/images/jacket4.png']),
      NewItem(
          name: "Max Cirro Men's Slides",
          price: 150.00,
          imagePath: ['assets/images/jacket5.png']),
    ];
    final List<Category> categories = [
      Category(
          name: "Men's Harrington\n Jacket",
          imagePath: 'assets/images/jacket.png'),
      Category(
          name: "Max Cirro Men's\n Slides",
          imagePath: 'assets/images/jacket2.png'),
      Category(
          name: "Men's Harrington\n Jacket",
          imagePath: 'assets/images/jacket3.png'),
      Category(
          name: "Max Cirro Men's\n Slides",
          imagePath: 'assets/images/jacket4.png'),
      Category(
          name: "Max Cirro Men's\n Slides",
          imagePath: 'assets/images/jacket5.png'),
    ];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/person_img.png',
                            width: 40,
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  "Mon",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Icon(Icons.shopping_bag,
                                  color: Colors.white, size: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: BlocProvider(
          create: (context) => MyDataBloc()
            ..add(FetchDataEvent()), // Fetch data when BLoC is created
          child:
              BlocBuilder<MyDataBloc, MyDataState>(builder: (context, state) {
            if (state is MyDataLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MyDataLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 14.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          filled: false,
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        CategoriesList(categories: categories),
                        ProductsList(
                            products: products), // Call the ProductsList
                        NewItemList(newitems: newitems), // Call the NewItemList
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is MyDataError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No data available.'));
          }),
        ),
      ),
    );
  }
}
