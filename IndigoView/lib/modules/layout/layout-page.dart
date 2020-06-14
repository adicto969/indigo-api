import 'package:flutter/material.dart';
import 'layout-state.dart';

class LayoutPage extends StatefulWidget {
  
  final String title;

  LayoutPage({Key key, this.title = ''}) : super(key: key);

  @override
  LayoutState createState() => LayoutState();
}