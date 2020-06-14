import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';
import 'questionary-page.dart';

class QuestionaryModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: QuestionaryPage(title: 'Questionary Page',),
    );
  }
}