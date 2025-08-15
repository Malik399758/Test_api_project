import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataItem>? data;
  final Support? support;

  const UserInfoModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      page: map['page'] as int?,
      perPage: map['per_page'] as int?,
      total: map['total'] as int?,
      totalPages: map['total_pages'] as int?,
      data: (map['data'] as List?)
          ?.map((e) => DataItem.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      support: map['support'] != null
          ? Support.fromMap(Map<String, dynamic>.from(map['support']))
          : null,
    );
  }

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data?.map((x) => x.toMap()).toList(),
      'support': support?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  UserInfoModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<DataItem>? data,
    Support? support,
  }) {
    return UserInfoModel(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  @override
  List<Object?> get props => [
    page,
    perPage,
    total,
    totalPages,
    data,
    support,
  ];
}

class DataItem extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const DataItem({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory DataItem.fromMap(Map<String, dynamic> map) {
    return DataItem(
      id: map['id'] as int?,
      email: map['email'] as String?,
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      avatar: map['avatar'] as String?,
    );
  }

  factory DataItem.fromJson(String source) =>
      DataItem.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  String toJson() => json.encode(toMap());

  DataItem copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return DataItem(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    avatar,
  ];
}

class Support extends Equatable {
  final String? url;
  final String? text;

  const Support({
    this.url,
    this.text,
  });

  factory Support.fromMap(Map<String, dynamic> map) {
    return Support(
      url: map['url'] as String?,
      text: map['text'] as String?,
    );
  }

  factory Support.fromJson(String source) =>
      Support.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'text': text,
    };
  }

  String toJson() => json.encode(toMap());

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [
    url,
    text,
  ];
}
