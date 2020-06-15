import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class User implements ParseJson {

  String firstName;
  String lastName;
  int companyId = 0;
  String mail;
  String phone;
  String rfc;
  String address;
  bool enabled = true;

  User({ this.firstName, this.lastName, this.companyId,
  this.mail, this.phone, this.rfc, this.address,
  this.enabled });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.firstName = jsonObject['firstName'] as String;
    this.lastName = jsonObject['lastName'] as String;
    this.companyId = jsonObject['companyId'] as int;
    this.mail = jsonObject['mail'] as String;
    this.phone = jsonObject['phone'] as String;
    this.rfc = jsonObject['rfc'] as String;
    this.address = jsonObject['address'] as String;
    this.enabled = jsonObject['enabled'] as bool;
 
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'companyId': companyId,
    'mail': mail,
    'phone': phone,
    'rfc': rfc,
    'address': address,
    'enabled': enabled
  };
  
}