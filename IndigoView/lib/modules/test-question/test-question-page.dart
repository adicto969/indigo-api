import 'package:flutter/material.dart';
import 'test-question-page-state.dart';

class TestQuestionPage extends StatefulWidget {
  
  final String title;

  TestQuestionPage({Key key, this.title = ''}) : super(key: key);

  @override
  TestQuestionPageState createState() => TestQuestionPageState();
}