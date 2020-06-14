import 'dart:convert';

import 'package:indigo/utils/ParseJson.dart';

class AuthModel  implements ParseJson{
  String accessToken;
  String tokenType;
  String error;
  int expiresIn;

  AuthModel({this.accessToken, this.tokenType, this.expiresIn});

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);

    this.accessToken = jsonObject['accessToken'] as String ?? '';
    this.tokenType = jsonObject['tokenType'] as String ?? '';
    this.expiresIn = jsonObject['expiresIn'] as int ?? 0;
    this.error = jsonObject['error'] as String ?? '';

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'tokenType': tokenType,
    'expiresIn': expiresIn
  };
}