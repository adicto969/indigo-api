import 'package:flutter/material.dart';
import 'questionary-state.dart';

class QuestionaryPage extends StatefulWidget {

  final String title;

  QuestionaryPage({Key key, this.title = ''}) : super(key: key);

  @override
  QuestionaryState createState() => QuestionaryState();
}