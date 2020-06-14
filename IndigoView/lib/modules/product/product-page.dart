import 'package:flutter/material.dart';
import 'product-page-state.dart';

class ProductPage extends StatefulWidget {
  
  final String title;

  ProductPage({Key key, this.title = ''}) : super(key: key);

  @override
  ProductPageState createState() => ProductPageState();
}