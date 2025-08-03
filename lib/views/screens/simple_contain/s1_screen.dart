import 'package:flutter/material.dart';
import 'package:test_apis_project/views/screens/simple_contain/s2_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Cart list to hold added items
  List<String> cartItems = [];

  // Sample product list
  List<String> products = ["Orange", "Banana", "Mango", "Apple"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen with cartItems
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                if (!cartItems.contains(item)) {
                  cartItems.add(item);
                }
              });
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: ListTile(
                title: Text(item),
                trailing: Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}
