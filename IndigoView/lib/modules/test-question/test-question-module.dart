import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'test-question-page.dart';

class TestQuestionModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: TestQuestionPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}