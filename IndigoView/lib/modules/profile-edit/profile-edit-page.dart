import 'package:flutter/material.dart';
import 'profile-edit-state.dart';

class ProfileEditPage extends StatefulWidget {

  final String title;

  ProfileEditPage({Key key, this.title = ''}) : super(key: key);

  @override
  ProfileEditState createState() => ProfileEditState();
}