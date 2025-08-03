// To parse this JSON data, do
//
//     final userApiModel = userApiModelFromJson(jsonString);

import 'dart:convert';

List<UserApiModel> userApiModelFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<UserApiModel>.from(jsonData.map((x) => UserApiModel.fromJson(x)));
}

String userApiModelToJson(List<UserApiModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class UserApiModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserApiModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) => new UserApiModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
