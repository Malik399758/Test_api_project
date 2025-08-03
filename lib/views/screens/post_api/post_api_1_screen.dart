import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApi1Screen extends StatefulWidget {
  const PostApi1Screen({super.key});

  @override
  State<PostApi1Screen> createState() => _PostApi1ScreenState();
}

class _PostApi1ScreenState extends State<PostApi1Screen> {
  // Text field
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  var url = 'https://reqres.in/api/login';

  // post api
  Future<void> postApi()async{
    try{
      // post api
      final response = await http.post(
        // url
          Uri.parse(url),
        // body
        body : jsonEncode({
            'email' : emailController.text,
            'password' : passwordController.text
          }),
          // header
        headers: {
          "Content-Type": "application/json",
        }
      );

      // check status code
      if(response.statusCode == 200){
        print('Response body : ${response.body}');
      }else{
        print('Failed status code : ${response.statusCode}');
        print('Response Body ---------> ${response.body}');
      }
    }catch(e){
      print('Error ---------->${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  postApi();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.orange,
                  ),
                  child: Center(child: Text('Post',style: TextStyle(color: Colors.white,fontSize: 20,
                  fontWeight: FontWeight.w500),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
