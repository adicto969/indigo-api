import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'currency-page.dart';

class CurrencyModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: CurrencyPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}