import 'dart:convert';

class User {
  final String? email;
  final String? password;

  User(this.email, this.password);

  User.fromJson(Map<String, dynamic> json): 
        email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };

  String toString() {
    return json.encode({"email": email, "password": password});
  }

  static User fromString(String string){

    return User.fromJson(json.decode(string));
  }
}