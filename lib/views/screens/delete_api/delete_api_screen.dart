import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteApiScreen extends StatefulWidget {
  const DeleteApiScreen({super.key});

  @override
  State<DeleteApiScreen> createState() => _DeleteApiScreenState();
}

class _DeleteApiScreenState extends State<DeleteApiScreen> {

  
  Future<void> deleteApi(int id)async{
    var url = 'https://jsonplaceholder.typicode.com/posts/$id';
    try{
      final response = await http.delete(Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0',
          'Accept': 'application/json',
        },
      );
      if(response.statusCode == 200){
        print('Response status code : ${response.statusCode}');
        print('Data deleted successfully');
        print('Response ------------->${response.body}');
      }else{
        print('Failed status code : ${response.statusCode}');
      }
    }catch(e){
      print('Error ------------->${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Api'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              deleteApi(1);
            },
            child: Text('Delete')),
      )
    );
  }
}
