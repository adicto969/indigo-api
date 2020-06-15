import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:indigo/modules/currency/models/currency-model.dart';

class CurrencyService{
  String apiUrl;
  Map<String, String> headers = {"Content-type": "application/json"};
 
 CurrencyService(){
   this.apiUrl = "http://localhost:3000/currencies";
 }

 Future<http.Response> create(Currency currency) async{
    return await http.post(this.apiUrl, headers: headers, body: '{"name": "dasd", "code": "dasd"}');
 }

 Future<bool> update(Currency currency) async{
  
 }

}