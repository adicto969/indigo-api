import 'dart:convert';

import 'package:indigo/utils/ParseJson.dart';

class Login implements ParseJson{
  String email;
  String password;

  Login({this.email, this.password});

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);

    this.email = jsonObject['email'] as String;
    this.password = jsonObject['password'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };
  
}