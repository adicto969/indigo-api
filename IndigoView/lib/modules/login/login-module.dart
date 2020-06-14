import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';
import 'login-page.dart';

class LoginModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: LoginPage(title: 'Login'),
      debugShowCheckedModeBanner: false,
    );
  }
}