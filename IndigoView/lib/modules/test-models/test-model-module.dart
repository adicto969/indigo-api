import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'test-model-page.dart';

class TestModelModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: TestModelPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}