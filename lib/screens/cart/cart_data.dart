List<dynamic> items = [
  {
    'image': 'assets/images/real/coffee2.jpg',
    'name': 'Coffee',
    'price': 9.99,
    'description': 'Buy 1 get 1 free',
    'rating': 4.5,
    'reviews': 100,
    'type': 'Beverages',
  },
];

class Cart {
  

  // Add an item to the cart
  void addItem(dynamic item) {
    items.add(item);
  }

  // Remove an item from the cart
  void removeItem(dynamic item) {
    items.remove(item);
  }

  // Update an item in the cart
  void updateItem(dynamic oldItem, dynamic newItem) {
    final index = items.indexOf(oldItem);
    if (index != -1) {
      items[index] = newItem;
    }
  }

  // Clear all items from the cart
  void clearCart() {
    items.clear();
  }

  // Get the count of items in the cart
  int getItemCount() {
    return items.length;
  }

}
