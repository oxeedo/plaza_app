import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final String reviewerName; // Required
  final String imageUrl; // Required
  final String secondaryImageUrl;
  final String shippingText;
  final String commentText;
  final String headerText;
  final String description;
  final String reviewText;
  final double rating; // Nullable rating
  final double ratings;
  final String ratingText;
  final String time; // e.g., "2 hours ago"

  const ReviewWidget({
    super.key,
    required this.description,
    required this.headerText,
    required this.shippingText,
    required this.commentText,
    required this.reviewerName, // Required reviewer name
    required this.imageUrl, // Required image URL
    required this.secondaryImageUrl,
    required this.reviewText,
    required this.ratings,
    required this.rating,
    required this.ratingText,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(description,
            style: TextStyle(fontSize: 14.0), textAlign: TextAlign.justify),
        SizedBox(height: 20.0),
        Text(
          headerText,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          shippingText,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          reviewText,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            children: [
              Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 8.0), // spacing
              Text(
                reviewText,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Text(
                ratings.toString(),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),

              SizedBox(width: 8.0), // spacing
              Text(
                ratingText,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl), // Required image URL
              radius: 30.0,
            ),

            SizedBox(width: 14.0), // Optional spacing between image and text
            Text(
              reviewerName,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 70.0),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < (rating) ? Icons.star : Icons.star_border,
                  color: index < (rating)
                      ? Theme.of(context).primaryColor
                      : Colors.grey, // Set color based on rating
                  size: 16.0,
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          commentText,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        //second reviews
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(secondaryImageUrl), // Required image URL
              radius: 30.0,
            ),

            SizedBox(width: 14.0), // Optional spacing between image and text
            Text(
              reviewerName,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 70.0),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < (rating) ? Icons.star : Icons.star_border,
                  color: index < (rating)
                      ? Theme.of(context).primaryColor
                      : Colors.grey, // Set color based on rating
                  size: 16.0,
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Text(
          commentText,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
