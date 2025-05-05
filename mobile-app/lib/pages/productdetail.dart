import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaza_ng/components/product.dart';
import 'package:plaza_ng/components/review_item.dart';
import 'package:plaza_ng/components/text_component.dart';
import 'package:plaza_ng/components/bloc/MyDataModel.dart';
import 'package:plaza_ng/components/counter/counter_page.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
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
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Navigate back to the previous screen
                              },
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Icon(Icons.favorite,
                                  color: Colors.black, size: 20.0),
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
          child: BlocBuilder<MyDataBloc, MyDataState>(
            builder: (context, state) {
              if (state is MyDataLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MyDataLoaded) {
                // Access the first variant
                final firstVariant =
                    state.data.isNotEmpty ? state.data[0] : null;
                final firstSize =
                    firstVariant?.size ?? "N/A"; // Default to "N/A"
                final firstColor =
                    firstVariant?.color ?? "N/A"; // Default to "N/A"
                final backgroundColor =
                    getColorFromString(firstColor); // Get Color from string

                // Prepare the list of sizes and colors from the loaded data
                state.data.map((variant) => variant.size).toList();
                state.data
                    .map((variant) => variant.color)
                    .toSet()
                    .toList(); // Unique colors

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: product.imagePath.isEmpty
                            ? Center(
                                child:
                                    CircularProgressIndicator()) // Show loading indicator if no images are available
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: product.imagePath.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: FutureBuilder(
                                      future: precacheImage(
                                        AssetImage(product.imagePath[index]),
                                        context,
                                      ),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Image.asset(
                                            product.imagePath[index],
                                            fit: BoxFit.cover,
                                          );
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text('\$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 12.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _showModalSize(context), // Pass sizes
                              child: TextIconRow(
                                text: "Size",
                                text2: firstSize, // Display the first size
                                icon: Icons.arrow_drop_down,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _showModalColor(context),
                              child: TextIconRow(
                                text: "Color",
                                text2BackgroundColor: state.selectedColor !=
                                        null
                                    ? getColorFromString(state.selectedColor)
                                    : backgroundColor,
                                icon: Icons.arrow_drop_down,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                height: 65,
                                child: BlocProvider(
                                  create: (context) => CounterCubit(),
                                  child: CounterPage(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 680,
                              child: ListView(
                                physics:
                                    NeverScrollableScrollPhysics(), // Prevent scrolling
                                shrinkWrap: true,
                                children: [
                                  ReviewWidget(
                                    description:
                                        "Built for life and made to last, this is full-zip cordury jacket is part of our Nike Life collection.\n The spacious fit gives you plentyof room layer underneath, while the soft corduroy keeps it casual and timeless.",
                                    headerText: "Shipping & Returns",
                                    shippingText:
                                        "Free standard shipping and free 60-days return",
                                    rating: 3.0, reviewText: " Reviews",
                                    ratings: 213, ratingText: " Reviews",
                                    reviewerName: "Alex Morgan",

                                    commentText:
                                        "Gucci transcribe its heritage, creativity and innovation into a plenitude of collecti. From staple items to distinctive accessories",
                                    time: "12 days ago",

                                    imageUrl:
                                        "assets/images/jacket.png", // Replace with an actual image URL
                                    secondaryImageUrl:
                                        "assets/images/jacket2.png",
                                  ),

                                  // Add more ReviewWidgets as needed
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Add to Bag",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is MyDataError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Center(child: Text('No data available.'));
            },
          ),
        ),
      ),
    );
  }

  void _showModalSize(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // Allows the modal to take the full height
      builder: (_) {
        return SizedBox(
          height: 400, // Set your desired height here
          child: BlocProvider.value(
            value: BlocProvider.of<MyDataBloc>(context),
            child: BlocBuilder<MyDataBloc, MyDataState>(
              builder: (context, state) {
                // Check if state is MyDataLoaded
                if (state is MyDataLoaded) {
                  // Display available sizes
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 120.0, right: 80),
                                child: Text(
                                  'Select Size', // Title for the bottom sheet
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                              ),
                            ],
                          ),
                        ),
                        // Display sizes from the state
                        ...state.data.map((model) {
                          bool isSelected = state.selectedSize ==
                              model.size; // Access the size property
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 8.0),
                            child: TextIconRow(
                              text: model.size.toUpperCase(), // Get size name
                              icon: Icons.check,
                              bgColor: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey[50], // Highlight if selected
                              iconColor: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              textColor:
                                  isSelected ? Colors.white : Colors.black,
                              onTap: () {
                                context.read<MyDataBloc>().add(SelectSizeEvent(
                                    model.size)); // Update selected size
                                Navigator.pop(
                                    context); // Close the modal after selection
                              },
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  );
                }
                return Center(
                    child: Text(
                        'No sizes available.')); // Handle loading or error states
              },
            ),
          ),
        );
      },
    );
  }

  void _showModalColor(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // Allows the modal to take the full height
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<MyDataBloc>(context),
          child: BlocBuilder<MyDataBloc, MyDataState>(
            builder: (context, state) {
              // Check if state is MyDataLoaded
              if (state is MyDataLoaded) {
                // Display available colors
                return SingleChildScrollView(
                  // Make the content scrollable
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 100.0, right: 90),
                              child: Text(
                                'Select Color', // Title for the bottom sheet
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(
                                    context); // Close the bottom sheet
                              },
                            ),
                          ],
                        ),
                      ),
                      // Display colors from the state
                      ...state.data.map((model) {
                        bool isSelected = state.selectedColor ==
                            model.color; // Access the color property

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          child: TextIconRow(
                            text: model.color.toUpperCase(), // Get color name
                            text2BackgroundColor:
                                getColorFromString(model.color),
                            icon: Icons.check,
                            bgColor: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey[50], // Highlight if selected
                            iconColor: isSelected ? Colors.white : Colors.white,
                            textColor: isSelected ? Colors.white : Colors.black,
                            onTap: () {
                              context.read<MyDataBloc>().add(SelectColorEvent(
                                  model.color)); // Update selected color
                              Navigator.pop(
                                  context); // Close the modal after selection
                            },
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              }
              return Center(
                child: Text('No colors available.'),
              ); // Handle loading or error states
            },
          ),
        );
      },
    );
  }

  Color getColorFromString(String color) {
    switch (color.trim().toLowerCase()) {
      // Use trim() to clean up spaces
      case 'orange':
        return Colors.orange;
      case 'black':
        return Colors.black;
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.grey; // Fallback color
    }
  }
}
