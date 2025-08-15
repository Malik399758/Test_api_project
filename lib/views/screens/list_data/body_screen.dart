
import 'package:flutter/material.dart';
import 'package:test_apis_project/models/user_model/list_model.dart';

class BodyScreen extends StatefulWidget {
  final ListModel item;
  BodyScreen({super.key,required this.item});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body screen'),
      ),
      body: Column(
        children: [
          Text('id : ${widget.item.id}'),
          Text('Body\n ${widget.item.body}'),
        ],
      )
    );
  }
}
