import 'package:bloc_ecommerce/core/utils/widgets/cached_image_builder.dart';
import 'package:flutter/material.dart';

Widget itemCard(
    {String imageUrl = "", String title = "", double? imageHeight}) {
  return Card(
    elevation: 5, // Adds shadow to the card
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: cachedImage(
            imageUrl,
            imageHeight!,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18, // Slightly smaller font size
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Slightly softer black color
            ),
          ),
        ),
      ],
    ),
  );
}
