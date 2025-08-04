import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginApiScreen extends StatefulWidget {
  const LoginApiScreen({super.key});

  @override
  State<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends State<LoginApiScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // login url
  var url = 'https://dummyjson.com/auth/login';

  // login api
  Future<void> loginApi()async{
    try{
      setState(() {
        isLoading = true;
      });
      // header
      final header = {
        'Content-Type': 'application/json'
      };
      // body
      final body = {
        'username' : userNameController.text,
        'password' : passwordController.text
      };
      // response
      final response = await http.post(
          Uri.parse(url),headers: header,body: jsonEncode(body));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState(() {
          isLoading = false;
        });
        print('Token --------------> ${data['accessToken']}');
        // print('Response body ---> ${response.body}');
      }else{
        setState(() {
          isLoading = false;
        });
        print('Failed status code : ${response.statusCode}');
        print('Response Body ----------> ${response.body}');
      }
    }catch(e){
      setState(() {
        isLoading = false;
      });
      print('Error ---------->${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login API'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login',style: TextStyle(color: Colors.orange,fontSize: 21,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter user name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
            
                    )
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
            
                      )
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    loginApi();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successfully')));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: isLoading ? SizedBox(
                      height: 20,  // height of the loader
                      width: 20,   // width of the loader
                      child: CircularProgressIndicator(
                        strokeWidth: 2,          // thickness of the loader ring
                        color: Colors.white,     // loader color
                      ),
                    )
                        :Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
