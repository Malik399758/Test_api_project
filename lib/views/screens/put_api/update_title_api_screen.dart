import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateTitleApiScreen extends StatefulWidget {
  const UpdateTitleApiScreen({super.key});

  @override
  State<UpdateTitleApiScreen> createState() => _UpdateTitleApiScreenState();
}

class _UpdateTitleApiScreenState extends State<UpdateTitleApiScreen> {
  final updateTitleController = TextEditingController();
  final updateBodyController = TextEditingController();
  Map<String,dynamic>? data;

  // put url
  var url = 'https://dummyjson.com/posts/1';

  Future<void> updateTitleApi()async{
    try{
      final body = {
        "title" : updateTitleController.text,
        "body" : updateBodyController.text
      };
      final headers =  {
        'Content-Type': 'application/json'
      };
      final response = await http.put(Uri.parse(url),headers: headers,body: jsonEncode(body));

      // check status code
      if(response.statusCode == 200){
        print('Response status code : ${response.statusCode}');
        final responseBody = jsonDecode(response.body);
        print('Response Body --------------> ${responseBody.toString()}');
        setState(() {
          data = Map<String,dynamic>.from(responseBody);
        });
      }else{
        print('Failed status code : ${response.statusCode}');
      }
    }catch(e){
      print('Error --------------->${e.toString()}');
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update title using put api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: updateTitleController,
              decoration: InputDecoration(
                hintText: 'Update title here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: updateBodyController,
              decoration: InputDecoration(
                  hintText: 'Update body here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: ()async{
                await updateTitleApi();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.orange.shade500
                ),
                child: Center(child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),)),
              ),
            ),
            SizedBox(height: 20,),
            data == null ? Text('no data') : Column(
              children: [
                Text(data!['title'] ?? 'no title'),
                Text(data!['body'] ?? 'no body'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
