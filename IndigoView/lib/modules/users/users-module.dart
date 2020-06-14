import 'package:flutter/material.dart';
import 'package:indigo/modules/users/users-page.dart';
import 'package:indigo/utils/HexColor.dart';

class UsersModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: UsersPage(title: 'Usuarios'),
      debugShowCheckedModeBanner: false,
    );
  }
}