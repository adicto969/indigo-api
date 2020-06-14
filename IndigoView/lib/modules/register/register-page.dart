import 'package:flutter/material.dart';
import 'register-page-state.dart';

class RegisterPage extends StatefulWidget {
  
  final String title;

  RegisterPage({Key key, this.title = ''}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}