import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Product implements ParseJson {

  String name;
  int currencyId;
  String price;
  String enabled;

  Product({ this.name, this.currencyId, this.price, this.enabled });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.currencyId = jsonObject['currencyId'] as int;
    this.price = jsonObject['price'] as String;
    this.enabled = jsonObject['enable'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'currencyId': currencyId,
    'price': price,
    'enabled': enabled
  };
  
}