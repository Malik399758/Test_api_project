import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_apis_project/views/screens/simple_contain/cart_item/cart_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<String> names = ['Yaseen','Ali','basit'];
  List<String> selectedItem = [];

  void addToCart(String name){

    if(!selectedItem.contains(name)){
      setState(() {
        selectedItem.add(name);
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item is already added')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                CartScreen(names: selectedItem)));
              },
                child: Icon(CupertinoIcons.cart)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      addToCart(names[index]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added')));
                    },
                    child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: Text(names[index])),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
