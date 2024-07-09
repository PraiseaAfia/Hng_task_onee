import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddToCheckout;

  ProductsScreen({super.key, required this.onAddToCheckout});

  final List<Map<String, dynamic>> products = [
    {'name': 'Bag', 'price': 10.0},
    {'name': 'Shoe', 'price': 15.0},
    {'name': 'Cloth', 'price': 20.0},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index]['name']),
          subtitle: Text("\$${products[index]['price']}"),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              onAddToCheckout(products[index]);
            },
          ),
        );
      },
    );
  }
}
