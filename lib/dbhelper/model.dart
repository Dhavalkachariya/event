import 'dart:convert';

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
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": jsonEncode(name),
        "email": jsonEncode(email),
        "password": jsonEncode(password),
      };
}

// class sqfliteDbmodel {
//   String name;
//   String email;
//   String password;

//   sqfliteDbmodel(this.name, this.email, this.password);

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       'name': name,
//       'email': email,
//       'password': password
//     };
//     return map;
//   }

//  fromMap(Map<String, dynamic> map) {
//     name = map['name'];
//     email = map['email'];
//     password = map['password'];
//   }
// }
