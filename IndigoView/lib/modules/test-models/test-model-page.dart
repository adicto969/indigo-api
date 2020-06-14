import 'package:flutter/material.dart';
import 'test-model-page-state.dart';

class TestModelPage extends StatefulWidget {
  
  final String title;

  TestModelPage({Key key, this.title = ''}) : super(key: key);

  @override
  TestModelPageState createState() => TestModelPageState();
}