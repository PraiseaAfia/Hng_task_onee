import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> checkoutItems;
  final Function(Map<String, dynamic>) onRemoveFromCheckout;

  CheckoutScreen(
      {required this.checkoutItems, required this.onRemoveFromCheckout});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: checkoutItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(checkoutItems[index]['name']),
          subtitle: Text("\$${checkoutItems[index]['price']}"),
          trailing: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              onRemoveFromCheckout(checkoutItems[index]);
            },
          ),
        );
      },
    );
  }
}
