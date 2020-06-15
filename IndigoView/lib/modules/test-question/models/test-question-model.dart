import 'dart:convert';
import 'package:indigo/utils/ParseJson.dart';

class TestQuestion implements ParseJson {

  int testId = 0;
  String question;
  int levelQuestion = 0;

  TestQuestion({ this.testId, this.question, this.levelQuestion });

  @override
  fromJson(String json) {
    Map<String, dynamic> jsonObject = jsonDecode(json);
    
    this.testId = jsonObject['testId'] as int;
    this.question = jsonObject['question'] as String;
    this.levelQuestion = jsonObject['levelQuestion'] as int;
 
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
    'testId': testId,
    'question': question,
    'levelQuestion': levelQuestion,
  };
  
}