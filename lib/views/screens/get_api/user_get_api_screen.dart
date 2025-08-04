import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_apis_project/models/get_apis_models/user_model.dart';
import 'package:http/http.dart' as http;

class UserGetApiScreen extends StatefulWidget {
  const UserGetApiScreen({super.key});

  @override
  State<UserGetApiScreen> createState() => _UserGetApiScreenState();
}

class _UserGetApiScreenState extends State<UserGetApiScreen> {
  //List<Map<String,dynamic>> list = [];
  List<UserApiModel> list = [];



  Future<void>? _getData;
  // url
  var url = 'https://jsonplaceholder.typicode.com/posts';

  // get user api
  Future<void> getUserApi()async{
    final response = await http.get(Uri.parse(url),
      headers: {
        'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
        'Accept': 'application/json',
      },
    );
    print('Json Response ------->${response.body}');

    // check status code
    if(response.statusCode == 200){
      final List responseBody = jsonDecode(response.body);
      print('Response Body -------->$responseBody');

      setState(() {
        list = responseBody.map((e) => UserApiModel.fromJson(e)).toList();
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData = getUserApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get user api'),
      ),
      body: FutureBuilder(
          future: _getData,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                ),
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }else{
              return ListView.builder(
                 itemCount: list.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(list[index].title.toString()),
                    );
                  });
            }
          }),
    );
  }
}
