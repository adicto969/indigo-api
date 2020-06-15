import 'package:flutter/material.dart';
import 'user-page-state.dart';

class UserPage extends StatefulWidget {
  
  final String title;

  UserPage({Key key, this.title = ''}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}