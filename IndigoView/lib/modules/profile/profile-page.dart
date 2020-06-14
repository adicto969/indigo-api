import 'package:flutter/material.dart';
import 'profile-state.dart';

class ProfilePage extends StatefulWidget {

  final String title;

  ProfilePage({Key key, this.title = ''}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}