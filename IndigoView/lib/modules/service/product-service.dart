import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:indigo/modules/product/models/product-model.dart';
import 'package:intl/number_symbols_data.dart';

class ProductService{
  String apiUrl;
  Map<String, String> headers = {"Content-type": "application/json"};
 
 ProductService(){
   this.apiUrl = "http://localhost:3000/";
 }

  Future<bool> getList() async{
    final response = await http.get('${this.apiUrl}products', headers: headers);

    if (response.statusCode == 200){
     
      var resJson = json.decode(response.body);
      final noInsert = resJson['data'];
      
      return true;
    }
    else
      throw Exception('Failed to load data');
  }

  Future<bool> getActive() async{
    final response = await http.get('${this.apiUrl}products/getactives', headers: headers);

    if (response.statusCode == 200){
      var resJson = json.decode(response.body);
      final noInsert = resJson['data'];
      
      return true;
    }
    else
      throw Exception('Failed to load data');
  }

  Future<Product> getById(int id) async{
    Product currency = new Product();

    final response = await http.get('${this.apiUrl}products/' + id.toString(), headers: headers);

    if (response.statusCode == 200){
      final prueba = json.decode(response.body);
      currency = currency.fromJson(prueba['data']);
    }
    else
      throw Exception('Failed to load data');
  } 

  Future<bool> create(Product product) async{
    product.currencyId = 7;
      final response = await http.post('${this.apiUrl}products', headers: headers, body: json.encode(product));

      if (response.statusCode == 200)
        return true;
      else
        throw Exception('Failed to save data');
  }

  Future<bool> update(Product product) async{
    final response = await http.put('${this.apiUrl}products/7', headers: headers, body: json.encode(product));

      if (response.statusCode == 200)
        return true;
      else
        throw Exception('Failed to save data');
  }

}