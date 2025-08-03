import 'package:flutter/material.dart';
import 'package:test_apis_project/models/cart_model/user_cart_model.dart';

class ImageCartScreen extends StatefulWidget {
  List<UserCartModel> allData = [];

  ImageCartScreen({super.key,required this.allData});

  @override
  State<ImageCartScreen> createState() => _ImageCartScreenState();
}

class _ImageCartScreenState extends State<ImageCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: widget.allData.isEmpty ? Center(child: Text('User data not found')) : ListView.builder(
          itemCount: widget.allData.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(widget.allData[index].image),
                          ),
                          Text(widget.allData[index].name),
                          Text(widget.allData[index].subtitle),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          })
    );
  }
}
