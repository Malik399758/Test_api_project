import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetListScreen extends StatefulWidget {
  const GetListScreen({super.key});

  @override
  State<GetListScreen> createState() => _GetListScreenState();
}

class _GetListScreenState extends State<GetListScreen> {
  var url = 'https://reqres.in/api/unknown';
  Future<void>? _getData;
  // list og object
  List<Map<String,dynamic>>? user;
  // map
  Map<String,dynamic>? support;

  int? page;
  
  // get
  Future<void> getUserList()async{
    try{
      // get response
      final response = await http.get(Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
          'Accept': 'application/json',
        },
      );
      
      // check status code here
      if(response.statusCode == 200){
        // decode, response convert into dart
        final responseBody = jsonDecode(response.body);
        
        setState(() {
          user = List<Map<String,dynamic>>.from(responseBody['data']) as List<Map<String, dynamic>>?;
          support = responseBody['support'];
          page = responseBody['total_pages'];
        });
        
      }else{
        print('Failed status code : ${response.statusCode}');
      }
      
    }catch(e){
      print('Error ------------->${e.toString()}');
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData = getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get list using api'),
      ),
      body: FutureBuilder(
          future: _getData,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.black87,));
            }else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }else{
              return ListView.builder(
                 itemCount: user!.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(user?[index]['name'] ?? 'no name'),
                      subtitle: Text(support?['text'] ?? 'no text'),
                      trailing: Text(page.toString()),
                    );
                  });
            }
          }),
    );
  }
}
