import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'company-page.dart';

class CompanyModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: CompanyPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}