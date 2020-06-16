import 'dart:convert';
import 'dart:ffi';
import 'package:indigo/utils/ParseJson.dart';

class Product implements ParseJson {

  String name;
  int currencyId = 0;
  double price = 0;
  //String enabled;

  Product({ this.name, this.currencyId, this.price/*, this.enabled*/ });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.currencyId = jsonObject['currencyId'] as int;
    this.price = jsonObject['price'] as double;
    //this.enabled = jsonObject['enable'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'currencyId': currencyId,
    'price': price
    //'enabled': enabled
  };
  
}