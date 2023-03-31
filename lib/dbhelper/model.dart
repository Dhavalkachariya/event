
class sqfliteDbmodel {
 late String name;
 late String email;
 late String password;

  sqfliteDbmodel(this.name, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password
    };
    return map;
  }

 sqfliteDbmodel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
}
