import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';

import '../more/orders/myOrderScreen.dart';
import 'cart_data.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({Key key, @required this.cart}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCartEmpty = false;
  @override
  void initState() {
    super.initState();
    if (items.isEmpty) {
      isCartEmpty = true;
    }
    else {
      isCartEmpty = false;
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var screenWidth = queryData.size.width / 100;
    return Scaffold(
      appBar: customAppBar(context, title: 'Cart'),
      body: isCartEmpty? Center(child: Text('Cart is Empty'),):Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.getItemCount(),
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    leading: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Price: \$${item['price'].toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Description: ${item['description']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rating: ${item['rating']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Reviews: ${item['reviews']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Type: ${item['type']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      color: Colors.red,
                      onPressed: () {
                        widget.cart.removeItem(item);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Item removed from cart'),
                          duration: Duration(seconds: 2),
                        ));
                        // Rebuild the screen after removing the item
                        
                        if(items.isEmpty){
                          isCartEmpty = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(screenWidth * 2),
            child: SizedBox(
              width: double.infinity,
              height: screenWidth * 12,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyOrderScreen(),
                    ),
                  );
                },
                child: Text('Place Order'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final double price;
  final String description;
  final double rating;
  final int reviews;
  final String type;

  CartItem({
    this.image,
    this.name,
    this.price,
    this.description,
    this.rating,
    this.reviews,
    this.type,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      image: map['image'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      rating: map['rating'],
      reviews: map['reviews'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'description': description,
      'rating': rating,
      'reviews': reviews,
      'type': type,
    };
  }
}

