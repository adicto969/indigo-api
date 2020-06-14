import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';
import 'layout-page.dart';

class LayoutModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        bottomAppBarColor: HexColor.fromHex('#161f30'),
        fontFamily: 'NunitoSans'
      ),
      home: LayoutPage(title: 'Index'),
      debugShowCheckedModeBanner: false,
    );
  }
}