
import 'package:flutter/material.dart';
import 'package:test_apis_project/models/user_model/user_info_model.dart';

class DetailsScreen extends StatefulWidget {
  final DataItem item;
  DetailsScreen({super.key,required this.item});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.item.firstName} ${widget.item.lastName}'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('${widget.item.avatar}',height: 200,),
              Text(' First Name : ${widget.item.firstName}'),
              Text(' Last Name : ${widget.item.lastName}'),
              Text(' ${widget.item.email}\n')
            ],
          ),
        ),
      ),
    );
  }
}
