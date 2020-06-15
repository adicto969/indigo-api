import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'test-page.dart';

class TestModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: TestPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}