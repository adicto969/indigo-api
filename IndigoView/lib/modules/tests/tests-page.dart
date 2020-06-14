import 'package:flutter/material.dart';
import 'package:indigo/modules/tests/tests-state.dart';

class TestsPage extends StatefulWidget {

  final String title;

  TestsPage({Key key, this.title = ''}) : super(key: key);

  @override
  TestsState createState() => TestsState();
}