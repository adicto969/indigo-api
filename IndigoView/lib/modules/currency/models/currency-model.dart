import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Currency implements ParseJson {

  String name;
  String code;
  //bool enabled = true;

  Currency({ this.name, this.code });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.code = jsonObject['code'] as String;
    //this.enabled = jsonObject['enabled'] as bool;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    //'enabled': enabled
  };
  
}