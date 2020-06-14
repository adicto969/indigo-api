import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';
import 'profile-page.dart';

class ProfileModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: ProfilePage(title: 'Profile Module'),
      debugShowCheckedModeBanner: false
    );
  }
}