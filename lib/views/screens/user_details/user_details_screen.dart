
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_apis_project/models/user_model/list_model.dart';
import 'package:test_apis_project/models/user_model/user_info_model.dart';
import 'package:test_apis_project/views/screens/user_details/details_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var url = 'https://reqres.in/api/users?page=2';

  List<DataItem> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  Future<void> getApi()async{
    try{
      final response = await http.get(Uri.parse(url),headers: {"x-api-key": "reqres-free-v1"},);
      print('Json Response ------------> ${response.body}');

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print('Status code --------> ${response.statusCode}');

        print('json decode response ------------> ${data.toString()}');

        setState(() {
          list.clear();
          for(var i in data["data"]){
            list.add(DataItem.fromMap(i));
          }
        });

      }else{
        print('Failed Status code --------> ${response.statusCode}');
      }
    }catch(e){
      print('Error ------------> ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: list.isEmpty ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            DetailsScreen(item: list[index])));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('${list[index].avatar}'),
            ),
            title: Text('${list[index].firstName} ${list[index].lastName}'),
            subtitle: Text('${list[index].email.toString()}'),
          ),
        );
      }),
    );
  }
}
