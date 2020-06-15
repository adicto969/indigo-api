import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'user-page.dart';

class UserModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: UserPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}