
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_apis_project/models/user_model/list_model.dart';
import 'package:test_apis_project/views/screens/list_data/body_screen.dart';

class ListDataScreen extends StatefulWidget {

  const ListDataScreen({super.key});

  @override
  State<ListDataScreen> createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  
  List<ListModel> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }
  Future<void> getApi()async{
    try{
      // json response
      final response = await http.get(Uri.parse(url));
      print('Json response ----------> ${response.body}');

      if(response.statusCode == 200){
        // json decode
        final data = jsonDecode(response.body);
        print('Status code ---------> ${response.statusCode}');
        print('json decode response -----------> ${data.toString()}');
        
        setState(() {
          list.clear();
          for(var i in data){
            list.add(ListModel.fromJson(i));
          }
        });
        
      }else{
        print('Failed status code -----------> ${response.statusCode}');
      }

    }catch(e){
      print('fetch data error -----------> ${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('List data fetch from server using api'),
        centerTitle: true,
      ),
      body: list.isEmpty ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            BodyScreen(item: list[index])));
          },
          child: Card(
            child: ListTile(
              title: Text('title : ${list[index].title}'),
            ),
          ),
        );
      })
    );
  }
}
