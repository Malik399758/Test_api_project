import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  List names;
  CartScreen({super.key,required this.names});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: widget.names.isEmpty ? Center(child: Text('No item added '))
          :ListView.builder(
         itemCount: widget.names.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(widget.names[index]),
            );
          })
    );
  }
}
