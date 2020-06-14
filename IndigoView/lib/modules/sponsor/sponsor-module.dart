import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'sponsor-page.dart';

class SponsorModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: SponsorPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}