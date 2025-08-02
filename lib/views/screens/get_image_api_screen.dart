import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetImageApiScreen extends StatefulWidget {
  const GetImageApiScreen({super.key});

  @override
  State<GetImageApiScreen> createState() => _GetImageApiScreenState();
}

class _GetImageApiScreenState extends State<GetImageApiScreen> {
/*  Future<void>? _getImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImage = getImageApi();
  }*/
  List<dynamic> list = [];
  var url = 'https://reqres.in/api/users?page=2';
  Future<void> getImageApi()async{
    try{
      // get response from api
     final response = await http.get(Uri.parse(url),
       headers: {
         'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
         'Accept': 'application/json',
       },);
     print('Response data -------->${response.body}');
     
     // check status code
      if(response.statusCode == 200){
        // convert into dart
        final responseBody = await jsonDecode(response.body);
        print('Response Body -------->${responseBody.toString()}');
        
        setState(() {
          list = responseBody['data'];
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
        title: Text('Get image using api'),
      ),
      body: FutureBuilder(
          future: getImageApi(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: Colors.black87,));
            }else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }else {
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${list[index]['avatar']}'
                        ),
                      ),
                      title: Text('${list[index]['first_name']}'),
                      subtitle: Text('${list[index]['last_name']}'),
                      trailing: Text('${list[index]['email']}'),
                    );
                  });
            }
          })
    );
  }
}
