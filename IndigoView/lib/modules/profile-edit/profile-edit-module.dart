import 'package:flutter/material.dart';
import 'package:indigo/utils/HexColor.dart';
import 'profile-edit-page.dart';

class ProfileEditModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: ProfileEditPage(title: 'Profile Module'),
      debugShowCheckedModeBanner: false
    );
  }
}