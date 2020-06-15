import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Test implements ParseJson {

  String name;
  int tesModelId = 0;
  int productId = 0;
  int companyId = 0;
  DateTime startDate;
  DateTime endDate;
  bool enabled = true;

  Test({ this.name, this.tesModelId, this.productId,
  this.startDate, this.endDate, this.enabled });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.tesModelId = jsonObject['tesModelId'] as int;
    this.productId = jsonObject['productId'] as int;
    this.companyId = jsonObject['companyId'] as int;
    this.startDate = jsonObject['startDate'] as DateTime;
    this.endDate = jsonObject['endDate'] as DateTime;
    this.enabled = jsonObject['enabled'] as bool;
 
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'tesModelId': tesModelId,
    'productId': productId,
    'companyId': companyId,
    'startDate': startDate,
    'enabled': enabled,
    'enabled': enabled
  };
  
}