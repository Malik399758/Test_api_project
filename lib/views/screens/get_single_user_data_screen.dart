import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class GetSingleUserDataScreen extends StatefulWidget {
  const GetSingleUserDataScreen({super.key});

  @override
  State<GetSingleUserDataScreen> createState() => _GetSingleUserDataScreenState();
}

class _GetSingleUserDataScreenState extends State<GetSingleUserDataScreen> {
  var url = 'https://reqres.in/api/users/2';
  Map<String,dynamic>? user;
  Map<String,dynamic>? support;
  Future<void>? _getSingleUserData;

  // get single user data
  Future<void> getSingleUserData()async{
    try{
      // get single user data
      final response = await http.get(Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
          'Accept': 'application/json',
        },
      );

      // check status code
      if(response.statusCode == 200){
        // decode convert into dart
        final responseBody = jsonDecode(response.body);
        print('Response Body --------->${responseBody.toString()}');


        setState(() {
          user = responseBody['data'];
          support = responseBody['support'];
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
    _getSingleUserData =  getSingleUserData(); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get single user data'),
      ),
      body: FutureBuilder(
          future: _getSingleUserData,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.black87,));
            }else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }else{
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${user!['avatar']}'),
                ),
                title: Text('${user!['first_name']}'),
                subtitle: Text(support?['text'] ?? 'no text'),
              );
            }
          })
    );
  }
}
