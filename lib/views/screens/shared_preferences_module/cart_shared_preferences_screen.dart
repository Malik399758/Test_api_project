import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartSharedPreferencesScreen extends StatefulWidget {
  List<String> list = [];
  CartSharedPreferencesScreen({super.key,required this.list});

  @override
  State<CartSharedPreferencesScreen> createState() => _CartSharedPreferencesScreenState();
}

class _CartSharedPreferencesScreenState extends State<CartSharedPreferencesScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }


  List<String> newList = [];

  void add() {
    setState(() {
      for (String item in widget.list) {
        if (!newList.contains(item)) {
          newList.add(item);
        }
      }
    });
    saveData();
  }



  void saveData()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('cart_items', newList);

  }

  void load() async {
    await getData();
    add();
  }

  Future<void> getData()async{
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('cart_items');

    if(savedList != null){
      setState(() {
       newList = savedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: newList.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(newList[index]),
              );
            }),
          )
        ],
      ),
    );
  }
}
