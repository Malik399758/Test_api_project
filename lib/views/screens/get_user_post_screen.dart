import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUserPostScreen extends StatefulWidget {
  const GetUserPostScreen({super.key});

  @override
  State<GetUserPostScreen> createState() => _GetUserPostScreenState();
}

class _GetUserPostScreenState extends State<GetUserPostScreen> {
  Future<void>? _getUserPost;
  var url = 'https://jsonplaceholder.typicode.com/posts';
  List<dynamic> list = [];
  
  // get user post
  Future<void> getUserPost()async{
    try{
      // get response from api
      final response = await http.get(Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
          'Accept': 'application/json',
        },
      );
      
      // check status code
      if(response.statusCode == 200){
        // decode convert into dart
        final responseBody = await jsonDecode(response.body);
        print('Response Body ----------->${responseBody.toString()}');
        
        setState(() {
          list = responseBody;
        });
      }else{
        print('Failed status code : ${response.statusCode}');
      }
    }catch(e){
      print('Error ------------>${e.toString()}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserPost = getUserPost();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get user post using api'),
      ),
      body: FutureBuilder(
          future: _getUserPost,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                ),
              );
            }else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }else {
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title: Text(' Title \n${list[index]['title']}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        subtitle: Text('Body \n${list[index]['body']}',style: TextStyle(fontSize: 12),),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
