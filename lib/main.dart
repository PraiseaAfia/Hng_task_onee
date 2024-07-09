import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'checkout_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AOCP Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _checkoutItems = [];

  static List<Widget> _widgetOptions(
      List<Map<String, dynamic>> checkoutItems,
      Function(Map<String, dynamic>) onAddToCheckout,
      Function(Map<String, dynamic>) onRemoveFromCheckout) {
    return <Widget>[
      ProductsScreen(onAddToCheckout: onAddToCheckout),
      CheckoutScreen(
          checkoutItems: checkoutItems,
          onRemoveFromCheckout: onRemoveFromCheckout),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AOCP Shopping App')),
      body: _widgetOptions(
        _checkoutItems,
        (item) {
          setState(() {
            _checkoutItems.add(item);
          });
        },
        (item) {
          setState(() {
            _checkoutItems.remove(item);
          });
        },
      )[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
