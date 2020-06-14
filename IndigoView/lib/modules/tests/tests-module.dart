import 'package:flutter/material.dart';
import 'package:indigo/modules/tests/tests-page.dart';
import 'package:indigo/utils/HexColor.dart';

class TestsModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: TestsPage(title: 'Pruebas'),
      debugShowCheckedModeBanner: false,
    );
  }
}