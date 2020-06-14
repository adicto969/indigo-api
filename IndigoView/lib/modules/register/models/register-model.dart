import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Register implements ParseJson {

  String name;
  String lastName;
  String secondLastName;
  String email;

  Register({ this.name, this.lastName, this.secondLastName, this.email });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.email = jsonObject['email'] as String;
    this.lastName = jsonObject['lastName'] as String;
    this.secondLastName = jsonObject['secondLastName'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'lastName': lastName,
    'secondLastName': secondLastName,
    'email': email
  };
  
}