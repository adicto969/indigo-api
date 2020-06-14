import 'dart:convert';

import 'package:indigo/utils/ParseJson.dart';

class Question implements ParseJson {
  int index;
  int order;
  String sentence;

  Question({this.index, this.order, this.sentence});

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);

    this.index = jsonObject['index'] as int;
    this.order = jsonObject['order'] as int;
    this.sentence = jsonObject['sentence'] as String;

    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'index': index,
    'order': order,
    'sentence': sentence
  };
}