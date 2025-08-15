
// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ListModel> listModelFromJson(String str) => List<ListModel>.from(json.decode(str).map((x) => ListModel.fromJson(x)));

String listModelToJson(List<ListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListModel {
  int userId;
  int id;
  String title;
  String body;

  ListModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
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
