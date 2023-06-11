import 'package:bite_buddies/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../cart/cart_data.dart';

class FoodItemScreen extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String description;
  final double price;
  final double rating;
  final int reviews;
  final String type;

  FoodItemScreen({
    this.imageUrl,
    this.itemName,
    this.description,
    this.price,
    this.rating,
    this.reviews,
    this.type,
  });

  void addToCart(BuildContext context) {
    // Create a Cart instance
    final cart = Cart();

    // Create the item to add
    final item = {
      'image': imageUrl,
      'name': itemName,
      'price': price,
      'description': description,
      'rating': rating,
      'reviews': reviews,
      'type': type,
    };

    // Add the item to the cart
    cart.addItem(item);

    // Show a snack bar notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item added to cart'),
      ),
    );

    // Pop the page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;

    return Scaffold(
      appBar: customAppBar(context, title: "Item Details"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenWidth * 75,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenWidth * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: screenWidth * 5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 2),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: screenWidth * 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: screenWidth * 4,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 2),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: screenWidth * 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 2),
                  Text(
                    description,
                    style: TextStyle(fontSize: screenWidth * 4),
                  ),
                  SizedBox(height: screenWidth * 4),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 2),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(screenWidth * 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.black),
                        SizedBox(width: screenWidth * 2),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontSize: screenWidth * 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: screenWidth * 2),
                        Text(
                          '(${reviews.toString()} reviews)',
                          style: TextStyle(fontSize: screenWidth * 4),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: screenWidth * 12,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to Cart functionality
                        addToCart(context);
                      },
                      child: Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
