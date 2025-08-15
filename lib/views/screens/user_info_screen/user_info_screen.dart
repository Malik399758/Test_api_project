import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_apis_project/models/user_model/user_info_model.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  List<UserInfoModel> list = [];
  var url = 'https://reqres.in/api/users?page=2';

  @override
  void initState() {
    super.initState();
    userInfoGet();
  }

  Future<void> userInfoGet() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        list.clear();
        list.add(UserInfoModel.fromJson(response.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('API'),
      ),
      body: list.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: list[0].data?.length ?? 0,
        itemBuilder: (context, index) {
          final user = list[0].data![index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar ?? ""),
            ),
            title: Text("${user.firstName} ${user.lastName}"),
            subtitle: Text(user.email ?? ""),
          );
        },
      ),
    );
  }
}
