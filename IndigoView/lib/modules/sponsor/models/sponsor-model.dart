import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class Sponsor implements ParseJson {

  String name;
  String bussinesName;
  String rfc;
  String address;
  String phone;
  String responsableName;
  String responsableMail;
  String responsablePhone;
  String mailForShipping;
  bool enabled = true;

  Sponsor({ this.name, this.bussinesName, this.rfc,
  this.address, this.phone, this.responsableName, this.responsableMail,
  this.responsablePhone, this.mailForShipping, this.enabled });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.name = jsonObject['name'] as String;
    this.bussinesName = jsonObject['bussinesName'] as String;
    this.rfc = jsonObject['rfc'] as String;
    this.address = jsonObject['address'] as String;
    this.responsableName = jsonObject['responsableName'] as String;
    this.responsableMail = jsonObject['responsableMail'] as String;
    this.responsablePhone = jsonObject['responsablePhone'] as String;
    this.mailForShipping = jsonObject['mailForShipping'] as String;
    this.enabled = jsonObject['enabled'] as bool;
 
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'bussinesName': bussinesName,
    'rfc': rfc,
    'address': address,
    'responsableName': responsableName,
    'responsableMail': responsableMail,
    'responsablePhone': responsablePhone,
    'mailForShipping': mailForShipping,
    'enabled': enabled
  };
  
}