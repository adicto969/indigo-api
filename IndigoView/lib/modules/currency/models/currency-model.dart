import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Currency implements ParseJson {

  String name;
  String code;
  String enabled;

  Currency({ this.name, this.code, this.enabled });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.code = jsonObject['email'] as String;
    this.enabled = jsonObject['lastName'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'enabled': enabled
  };
  
}