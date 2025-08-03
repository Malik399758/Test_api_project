import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<String> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("Cart is empty"))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text(cartItems[index]),
          );
        },
      ),
    );
  }
}
