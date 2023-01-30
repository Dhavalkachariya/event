import 'dart:convert';

import 'package:sqflite/sqflite.dart';

sqfliteDbmodel sqfliteDbmodelFromJson(String str) =>
    sqfliteDbmodel.fromJson(json.decode(str));

String sqfliteDbmodelToJson(sqfliteDbmodel data) => json.encode(data.toJson());

class sqfliteDbmodel {
  sqfliteDbmodel({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;
  String email;
  String password;

  factory sqfliteDbmodel.fromJson(Map<String, dynamic> json) => sqfliteDbmodel(
      name: json["name"], email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {
        "name": jsonEncode(name),
        "email": jsonEncode(email),
        "password": jsonEncode(password),
      };
}
