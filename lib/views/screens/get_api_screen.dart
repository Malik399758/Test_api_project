import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  List<dynamic> list = [];
  Future<void> getApi() async{
    try{
      var url = 'https://jsonplaceholder.typicode.com/users';
      final response = await http.get(Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
          'Accept': 'application/json',
        },
      );
      print('Response body ----->${response.body}');

      if(response.statusCode == 200){
        final responseBody = jsonDecode(response.body);
        print('Response Body ----->$responseBody');
        setState(() {
          list = responseBody;
        });
      }else{
        print('Failed with status code : ${response.statusCode}');
      }
    }catch(e){
      print('Error ---------->$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Api'),
      ),
      body: list.isEmpty ? Center(child: CircularProgressIndicator()) :
          ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.green,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text('Id : ${list[index]['id']}'),
                            Text('Name : ${list[index]['name']}'),
                            Text('UserName : ${list[index]['username']}'),
                            Text('Email : ${list[index]['email']}')
                      
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text('Address Street : ${list[index]['address']['street']}'),
                            Text('Address Suite : ${list[index]['address']['suite']}'),
                            Text('Address City : ${list[index]['address']['city']}'),
                            Text('Address Zipcode : ${list[index]['address']['zipcode']}'),
                            Text('Address Street : ${list[index]['address']['street']}'),
                            Text('Address Geo lat : ${list[index]['address']['geo']['lat']}'),
                            Text('Address Geo lng : ${list[index]['address']['geo']['lng']}'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.grey,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text('Phone : ${list[index]['phone']}'),
                            Text('Website : ${list[index]['website']}'),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.orange,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text('Company name: ${list[index]['company']['name']}'),
                            Text('Company catchPhrase : ${list[index]['company']['catchPhrase']}',textAlign: TextAlign.center,),
                            Text('Company bs : ${list[index]['company']['bs']}'),
                          ],
                        ),
                      ),
                    ),

                  ],
                );
          })

    );
  }
}
