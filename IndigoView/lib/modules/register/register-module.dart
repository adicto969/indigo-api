import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'register-page.dart';

class RegisterModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: RegisterPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}