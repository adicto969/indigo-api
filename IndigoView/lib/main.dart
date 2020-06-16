import 'package:flutter/material.dart';
import 'package:indigo/main-routing.dart';
import 'package:indigo/modules/service/locator.dart';
import 'package:indigo/utils/HexColor.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      initialRoute: 'product',
      navigatorKey: GlobalKey<NavigatorState>(),
      onGenerateRoute: MainRouting.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
