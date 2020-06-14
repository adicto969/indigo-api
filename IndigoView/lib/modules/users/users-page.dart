import 'package:flutter/material.dart';
import 'package:indigo/modules/users/users-state.dart';

class UsersPage extends StatefulWidget {

  final String title;

  UsersPage({Key key, this.title = ''}) : super(key: key);

  @override
  UsersState createState() => UsersState();
}