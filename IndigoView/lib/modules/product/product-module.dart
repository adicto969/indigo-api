import 'package:flutter/material.dart';
import '../../main-routing.dart';
import 'product-page.dart';

class ProductModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: ProductPage(title: 'Page Register'),
      onGenerateRoute: MainRouting.generateRoute,
    );
  }
}